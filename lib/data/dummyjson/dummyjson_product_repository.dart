import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app_tablayout/domain/entities/category.dart';
import 'package:flutter_app_tablayout/domain/entities/product.dart';
import 'package:flutter_app_tablayout/domain/repositories/product_repository.dart';

class DummyJsonProductRepository implements ProductRepository {
  static const _mockAssetPath = 'lib/assets/mock_products.json';

  Future<Map<String, dynamic>> _loadData() async {
    final raw = await rootBundle.loadString(_mockAssetPath);
    final data = jsonDecode(raw) as Map<String, dynamic>;
    return data;
  }

  List<Product> _parseProducts(Map<String, dynamic> data) {
    final items = data['products'] as List<dynamic>? ?? [];
    return items
        .map(
          (item) => Product(
            id: item['id'] as int,
            title: item['title'] as String? ?? 'Product',
            description: item['description'] as String? ?? '',
            thumbnailUrl: item['thumbnail'] as String? ?? '',
            price: (item['price'] as num?)?.toDouble() ?? 0,
            rating: (item['rating'] as num?)?.toDouble() ?? 0,
            category: item['category'] as String? ?? '',
            brand: item['brand'] as String? ?? '',
            originalPrice: (item['originalPrice'] as num?)?.toDouble() ?? 0,
            discountPercent:
                (item['discountPercent'] as num?)?.toDouble() ?? 0,
            imageUrls: (item['imageUrls'] as List<dynamic>? ?? [])
                .map((value) => value.toString())
                .toList(growable: false),
            colorOptions: (item['colorOptions'] as List<dynamic>? ?? [])
                .map((value) => value.toString())
                .toList(growable: false),
            variants: (item['variants'] as List<dynamic>? ?? [])
                .map(
                  (variant) => ProductVariant(
                    label: variant['label'] as String? ?? '',
                    price: (variant['price'] as num?)?.toDouble() ?? 0,
                    originalPrice:
                        (variant['originalPrice'] as num?)?.toDouble() ?? 0,
                  ),
                )
                .toList(growable: false),
            ratingCount: item['ratingCount'] as int? ?? 0,
            reviewCount: item['reviewCount'] as int? ?? 0,
            warrantyLabel: item['warrantyLabel'] as String? ?? '',
            exchangeOffer: _parseOffer(item['exchangeOffer']),
            emiOffer: _parseOffer(item['emiOffer']),
            bankOffers: _parseOffers(item['bankOffers']),
            deliveryDetails: _parseInfoItems(item['deliveryDetails']),
            serviceHighlights: _parseInfoItems(item['serviceHighlights']),
            productHighlights: _parseInfoItems(item['productHighlights']),
            reviewHighlights: _parseReviewHighlights(item['reviewHighlights']),
          ),
        )
        .toList(growable: false);
  }

  List<Category> _parseCategories(Map<String, dynamic> data) {
    final items = data['categories'] as List<dynamic>? ?? [];
    if (items.isNotEmpty) {
      return items
          .map(
            (item) => Category(
              id: item.toString(),
              title: item.toString(),
            ),
          )
          .toList(growable: false);
    }
    final products = _parseProducts(data);
    final categoryTitles = <String>{};
    for (final product in products) {
      if (product.category.isNotEmpty) {
        categoryTitles.add(product.category);
      }
    }
    return categoryTitles
        .map((title) => Category(id: title, title: title))
        .toList(growable: false);
  }

  ProductOffer? _parseOffer(dynamic raw) {
    if (raw is! Map<String, dynamic>) return null;
    return ProductOffer(
      title: raw['title'] as String? ?? '',
      subtitle: raw['subtitle'] as String? ?? '',
      badge: raw['badge'] as String? ?? '',
      actionLabel: raw['actionLabel'] as String? ?? '',
    );
  }

  List<ProductOffer> _parseOffers(dynamic raw) {
    if (raw is! List<dynamic>) return const [];
    return raw
        .map(
          (item) => ProductOffer(
            title: item['title'] as String? ?? '',
            subtitle: item['subtitle'] as String? ?? '',
            badge: item['badge'] as String? ?? '',
            actionLabel: item['actionLabel'] as String? ?? '',
          ),
        )
        .toList(growable: false);
  }

  List<ProductInfoItem> _parseInfoItems(dynamic raw) {
    if (raw is! List<dynamic>) return const [];
    return raw
        .map(
          (item) => ProductInfoItem(
            title: item['title'] as String? ?? '',
            subtitle: item['subtitle'] as String? ?? '',
            icon: item['icon'] as String? ?? '',
          ),
        )
        .toList(growable: false);
  }

  List<ProductReviewHighlight> _parseReviewHighlights(dynamic raw) {
    if (raw is! List<dynamic>) return const [];
    return raw
        .map(
          (item) => ProductReviewHighlight(
            title: item['title'] as String? ?? '',
            subtitle: item['subtitle'] as String? ?? '',
            rating: (item['rating'] as num?)?.toDouble() ?? 0,
          ),
        )
        .toList(growable: false);
  }

  @override
  Future<List<Product>> fetchFeatured({int limit = 10}) async {
    final data = await _loadData();
    return _parseProducts(data).take(limit).toList(growable: false);
  }

  @override
  Future<List<Category>> fetchCategories() async {
    final data = await _loadData();
    return _parseCategories(data);
  }

  @override
  Future<Product> fetchProductById(int id) async {
    final data = await _loadData();
    final products = _parseProducts(data);
    return products.firstWhere(
      (product) => product.id == id,
      orElse: () => products.first,
    );
  }
}
