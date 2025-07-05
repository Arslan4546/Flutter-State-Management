import 'package:favorite_select_del_practice/Bloc/favorite_bloc/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favoriteItemsList.length,
                itemBuilder: (context, index) {
                  final item = state.favoriteItemsList[index];
                  return ListTile(title: Text(item.value));
                },
              );
            case ListStatus.failed:
              return const Center(child: Text('Error loading favorites'));
          }
        },
      ),
    );
  }
}
