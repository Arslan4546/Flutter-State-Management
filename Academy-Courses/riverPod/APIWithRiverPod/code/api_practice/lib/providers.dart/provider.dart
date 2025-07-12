import 'package:api_practice/API_Service/product_api_provider.dart';
import 'package:api_practice/providers.dart/product_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productAPIProvider =
    StateNotifierProvider<ProductAPIStateNotifier, ProductState>((ref) {
      return ProductAPIStateNotifier();
    });
