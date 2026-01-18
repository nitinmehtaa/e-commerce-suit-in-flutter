import 'package:flutter_app_tablayout/domain/entities/category.dart';
import 'package:flutter_app_tablayout/domain/entities/product.dart';
import 'package:flutter_app_tablayout/domain/repositories/product_repository.dart';

class FakeProductRepository implements ProductRepository {
  FakeProductRepository({
    List<Product>? products,
    List<Category>? categories,
  })  : _products = products ??
            const [
              Product(
                id: 1,
                title: 'Sample Phone',
                description: 'Fast device',
                thumbnailUrl: '',
                price: 499,
                rating: 4.5,
                category: 'smartphones',
              ),
            ],
        _categories = categories ??
            const [
              Category(id: 'smartphones', title: 'Smartphones'),
              Category(id: 'laptops', title: 'Laptops'),
            ];

  final List<Product> _products;
  final List<Category> _categories;

  @override
  Future<List<Product>> fetchFeatured({int limit = 10}) async {
    return _products.take(limit).toList(growable: false);
  }

  @override
  Future<List<Category>> fetchCategories() async {
    return _categories;
  }

  @override
  Future<Product> fetchProductById(int id) async {
    return _products.firstWhere(
      (product) => product.id == id,
      orElse: () => _products.first,
    );
  }
}
