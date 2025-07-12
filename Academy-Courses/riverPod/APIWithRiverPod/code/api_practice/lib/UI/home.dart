import 'package:api_practice/API_Service/product_model.dart';
import 'package:api_practice/providers.dart/product_states.dart';
import 'package:api_practice/providers.dart/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiProvider = ref.watch(productAPIProvider);
    return Scaffold(
      body: Center(
        child: switch (apiProvider) {
          ProductInitialState() => InitialdataWidget(),
          ProductLoadingState() => LoadingDataWidget(),
          ProductLoadedState(productList: var product) => LoadedDataWidget(
            productList: product,
          ),
          ProductErrorState(errorMessage: var error) => Text(error.toString()),
        },
      ),
    );
  }
}

class LoadingDataWidget extends StatelessWidget {
  const LoadingDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class InitialdataWidget extends ConsumerWidget {
  const InitialdataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Press the button to fetch data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {
            ref.watch(productAPIProvider.notifier).fetchProduct();
          },
          child: Text("Fetch Data"),
        ),
      ],
    );
  }
}

class LoadedDataWidget extends StatelessWidget {
  const LoadedDataWidget({super.key, required this.productList});
  final List<ProductModel> productList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return ListTileWidget(productModel: productList[index]);
      },
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://via.placeholder.com/150"),
      ),
      title: Text(productModel.title),
      subtitle: Text("${productModel.name} - ${productModel.id}"),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
