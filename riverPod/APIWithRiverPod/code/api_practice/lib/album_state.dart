import 'package:api_practice/API_Service/api_service.dart';
import 'package:api_practice/API_Service/product_model.dart';

sealed class AlbumState {}

class AlbumInitialState extends AlbumState {}

class AlbumLoadingState extends AlbumState {}

class AlbumLoadedState extends AlbumState {
  final List<ProductModel> productList;
  AlbumLoadedState({required this.productList});
}

class AlbumErrorState extends AlbumState {
  final String errorMessage;
  AlbumErrorState({required this.errorMessage});
}
