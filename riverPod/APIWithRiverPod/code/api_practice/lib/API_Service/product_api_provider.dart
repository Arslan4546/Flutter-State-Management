import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product_model.dart';

class ProductApiProvider extends ApiService with ChangeNotifier {
  @override
  String get apiURL => "/products";

  // fetchProductAPI function
  bool isInitial = true;
  bool isLoading = false;
  bool isLoaded = false;
  late List<ProductModel> productList;

  Future<List<ProductModel>> fetchProductAPI() async {
    isInitial = false;
    isLoading = true;
    notifyListeners();
    List jsonList = await fetchAPI();
    isLoading = false;
    isLoaded = true;
    notifyListeners();
    productList = jsonList.map((map) => ProductModel.fromMap(map)).toList();
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
