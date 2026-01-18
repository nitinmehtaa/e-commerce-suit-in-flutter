import 'package:flutter_app_tablayout/domain/entities/category.dart';
import 'package:flutter_app_tablayout/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchFeatured({int limit});
  Future<List<Category>> fetchCategories();
  Future<Product> fetchProductById(int id);
}
