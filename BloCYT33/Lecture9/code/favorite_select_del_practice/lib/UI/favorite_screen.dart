import 'package:favorite_select_del_practice/Bloc/favorite_bloc/bloc/favorite_bloc.dart';
import 'package:favorite_select_del_practice/Model/favorite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(FetchListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favoriteItemsList.length,
                  itemBuilder: (context, index) {
                    final item = state.favoriteItemsList[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.id.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            FavoriteItemModel favItem = FavoriteItemModel(
                              id: item.id,
                              value: item.value,
                              isFavorite: item.isFavorite ? false : true,
                            );
                            context.read<FavoriteBloc>().add(
                              FavoriteItemEvent(item: favItem),
                            );
                          },
                          icon: item.isFavorite
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                        ),
                      ),
                    );
                  },
                );
              case ListStatus.failed:
                return const Center(child: Text('Error loading favorites'));
            }
          },
        ),
      ),
    );
  }
}
