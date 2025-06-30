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
      var product = await productApiProvider.fetchAPI();
      state = ProductLoadedState(productList: product);
    } catch (e) {
      state = ProductErrorState(errorMessage: e.toString());
    }
  }
}

class ProductApiProvider extends ApiService {
  @override
  String get apiURL => "/products";

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
