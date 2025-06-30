import 'package:api_practice/API_Service/product_api_provider.dart';
import 'package:api_practice/product_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_service.dart';
import 'product_model.dart';

class ProductAPIStateNotifier extends StateNotifier<ProductState> {
  ProductApiProvider productApiProvider = ProductApiProvider();
  ProductAPIStateNotifier() : super(ProductInitialState());
  void fetchProduct() async {
    state = ProductLoadingState();
    try {
      print("try on");
      List<ProductModel> product = await productApiProvider.fetchProductAPI();
      state = ProductLoadedState(productList: product);
      print("state mai aa gye hai api");
    } catch (e) {
      state = ProductErrorState(errorMessage: e.toString());
      print("Error Trigger");
    }
  }
}

class ProductApiProvider extends ApiService {
  @override
  String get apiURL => "/products";

  Future<List<ProductModel>> fetchProductAPI() async {
    List jsonList = await fetchAPI();
    List<ProductModel> productList = jsonList
        .map((map) => ProductModel.fromMap(map))
        .toList();
    return productList;
  }
  // fetchProductAPIBySingleID function

  Future<ProductModel> fetchProductAPIBySingleID(String endPoint) async {
    var data = await fetchAPIBySingleID(endPoint);
    return ProductModel.fromMap(data);
  }

  // insertProductAPI function
  Future<bool> insertProductAPI(ProductModel productModel) async {
    return insertAPI(productModel.toMap());
  }

  // updateProductAPI function
  Future<bool> updateProductAPI(ProductModel productModel) async {
    return updateAPI("${productModel.id}", productModel.toMap());
  }

  // deleteProductAPI function
  Future<bool> deleteProductAPI(ProductModel productModel) async {
    return updateAPI("${productModel.id}", productModel.toMap());
  }
}
