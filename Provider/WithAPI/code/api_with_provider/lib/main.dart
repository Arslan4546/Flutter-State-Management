import 'package:api_with_provider/API_Service/product_api_provider.dart';
import 'package:api_with_provider/API_Service/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductApiProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Consumer<ProductApiProvider>(
          builder: (context, value, child) {
            if (value.isInitial) {
              return const Center(child: InitialdataWidget());
            } else if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (value.isLoaded) {
              return ListViewWidget(productList: value.productList);
            } else {
              return const Center(child: Text("No Data Found"));
            }
          },
        ),
      ),
    );
  }
}

class InitialdataWidget extends StatelessWidget {
  const InitialdataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Press the button to fetch data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {
            context.read()<ProductApiProvider>().fetchProductAPI();
          },
          child: Text("Fetch Data"),
        ),
      ],
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.productList});
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
