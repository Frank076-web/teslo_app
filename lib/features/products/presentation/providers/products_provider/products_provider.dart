import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/products/products.dart';

part 'products_provider_notifier.dart';
part 'products_provider_state.dart';

final productsProvider =
    StateNotifierProvider.autoDispose<ProductsNotifier, ProductsState>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);

  return ProductsNotifier(productsRepository: productsRepository);
});
