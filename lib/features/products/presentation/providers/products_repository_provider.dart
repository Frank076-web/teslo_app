import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/auth/auth.dart';
import 'package:teslo_app/features/products/products.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final accesToken = ref.watch(authProvider).user?.token ?? '';

  final productsRepository = ProductsRepositoryImpl(ProductsDatasourceImpl(
    accesToken: accesToken,
  ));

  return productsRepository;
});
