import 'package:flutter_gatjed_poc/src/features/products/model/products_response.dart';
import 'package:flutter_gatjed_poc/src/features/products/model/remote/products_api.dart';

class ProductsRepository {
  final productsApiProvider = ProductsApi();

  Future<ProductsResponse> fetchAllMovies() => productsApiProvider.getAllProducts();
}
