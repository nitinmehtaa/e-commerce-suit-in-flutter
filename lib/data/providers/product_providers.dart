import 'package:flutter_app_tablayout/data/dummyjson/dummyjson_product_repository.dart';
import 'package:flutter_app_tablayout/domain/entities/category.dart';
import 'package:flutter_app_tablayout/domain/entities/product.dart';
import 'package:flutter_app_tablayout/domain/repositories/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return DummyJsonProductRepository();
});

final featuredProductsProvider = FutureProvider<List<Product>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchFeatured(limit: 12);
});

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchCategories();
});

final productDetailProvider =
    FutureProvider.family<Product, int>((ref, productId) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchProductById(productId);
});
