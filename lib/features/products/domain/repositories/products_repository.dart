import 'package:teslo_app/features/products/domain/domain.dart';

abstract class ProductsRepository {
  Future<Product> findProductsById(String id);

  Future<List<Product>> searchProductsByTerm(String term);

  Future<List<Product>> findProductsByPage({int limit = 10, int offset = 0});

  Future<List<Product>> createUpdateProduct(Map<String, dynamic> productLike);
}
