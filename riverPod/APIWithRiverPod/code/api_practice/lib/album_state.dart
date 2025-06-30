import 'package:api_practice/API_Service/api_service.dart';
import 'package:api_practice/API_Service/product_model.dart';

sealed class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> productList;
  ProductLoadedState({required this.productList});
}

class ProductErrorState extends ProductState {
  final String errorMessage;
  ProductErrorState({required this.errorMessage});
}
