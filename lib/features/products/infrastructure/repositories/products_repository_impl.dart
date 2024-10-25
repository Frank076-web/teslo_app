import 'package:teslo_app/features/products/domain/domain.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);

  @override
  Future<List<Product>> createUpdateProduct(Map<String, dynamic> productLike) {
    return datasource.createUpdateProduct(productLike);
  }

  @override
  Future<Product> findProductsById(String id) {
    return datasource.findProductsById(id);
  }

  @override
  Future<List<Product>> findProductsByPage({int limit = 10, int offset = 0}) {
    return datasource.findProductsByPage(limit: limit, offset: offset);
  }

  @override
  Future<List<Product>> searchProductsByTerm(String term) {
    return datasource.searchProductsByTerm(term);
  }
}
