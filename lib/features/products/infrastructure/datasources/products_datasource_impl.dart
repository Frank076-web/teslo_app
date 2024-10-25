import 'package:dio/dio.dart';
import 'package:teslo_app/config/config.dart';

import 'package:teslo_app/features/products/domain/domain.dart';
import 'package:teslo_app/features/products/infrastructure/infrastructure.dart';

class ProductsDatasourceImpl implements ProductsDatasource {
  late final Dio dio;
  final String accesToken;

  ProductsDatasourceImpl({required this.accesToken})
      : dio = Dio(BaseOptions(
          baseUrl: Enviroment.apiUrl,
          headers: {
            'Authorization': 'Bearer $accesToken',
          },
        ));

  @override
  Future<List<Product>> createUpdateProduct(Map<String, dynamic> productLike) {
    // TODO: implement createUpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> findProductsById(String id) {
    // TODO: implement findProductsById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> findProductsByPage(
      {int limit = 10, int offset = 0}) async {
    final response = await dio.get<List>(
      '/products',
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
    );

    final List<Product> products = [];

    for (final product in response.data ?? []) {
      products.add(ProductsMapper.productApiV1ResponseToEntity(product));
    }

    return products;
  }

  @override
  Future<List<Product>> searchProductsByTerm(String term) {
    // TODO: implement searchProductsByTerm
    throw UnimplementedError();
  }
}
