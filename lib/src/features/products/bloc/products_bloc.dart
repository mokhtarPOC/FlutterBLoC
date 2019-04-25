import 'package:flutter_gatjed_poc/src/features/products/model/products_response.dart';
import 'package:flutter_gatjed_poc/src/features/products/model/repository/products_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc {
  final _repository = ProductsRepository();
  final _productsFetcher = PublishSubject<List<Product>>();

  Observable<List<Product>> get allProducts => _productsFetcher.stream;

  getAllProducts() async {
    ProductsResponse response = await _repository.fetchAllMovies();
    _productsFetcher.sink.add(response.data.products);
  }

  dispose() {
    _productsFetcher.close();
  }
}

final bloc = ProductsBloc();
