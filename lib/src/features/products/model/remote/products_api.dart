import 'dart:async';
import 'dart:convert';

import 'package:flutter_gatjed_poc/src/features/products/model/products_response.dart';
import 'package:http/http.dart' show Client;

class ProductsApi {
  Client client = Client();
  final _baseUrl = "http://www.mocky.io/v2/5cc1d55f2d000064005e9b95?mocky-delay=1500ms";

  Future<ProductsResponse> getAllProducts() async {
    final response = await client.get(_baseUrl);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ProductsResponse.fromJson(json.decode(response.body));

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load products');
    }
  }
}
