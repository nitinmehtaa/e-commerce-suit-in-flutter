class Product {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.price,
    required this.rating,
    required this.category,
    this.brand = '',
    this.originalPrice = 0,
    this.discountPercent = 0,
    this.imageUrls = const [],
    this.colorOptions = const [],
    this.variants = const [],
    this.ratingCount = 0,
    this.reviewCount = 0,
    this.warrantyLabel = '',
    this.exchangeOffer,
    this.emiOffer,
    this.bankOffers = const [],
    this.deliveryDetails = const [],
    this.serviceHighlights = const [],
    this.productHighlights = const [],
    this.reviewHighlights = const [],
  });

  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final double price;
  final double rating;
  final String category;
  final String brand;
  final double originalPrice;
  final double discountPercent;
  final List<String> imageUrls;
  final List<String> colorOptions;
  final List<ProductVariant> variants;
  final int ratingCount;
  final int reviewCount;
  final String warrantyLabel;
  final ProductOffer? exchangeOffer;
  final ProductOffer? emiOffer;
  final List<ProductOffer> bankOffers;
  final List<ProductInfoItem> deliveryDetails;
  final List<ProductInfoItem> serviceHighlights;
  final List<ProductInfoItem> productHighlights;
  final List<ProductReviewHighlight> reviewHighlights;
}

class ProductVariant {
  const ProductVariant({
    required this.label,
    required this.price,
    required this.originalPrice,
  });

  final String label;
  final double price;
  final double originalPrice;
}

class ProductOffer {
  const ProductOffer({
    required this.title,
    required this.subtitle,
    this.badge = '',
    this.actionLabel = '',
  });

  final String title;
  final String subtitle;
  final String badge;
  final String actionLabel;
}

class ProductInfoItem {
  const ProductInfoItem({
    required this.title,
    required this.subtitle,
    this.icon = '',
  });

  final String title;
  final String subtitle;
  final String icon;
}

class ProductReviewHighlight {
  const ProductReviewHighlight({
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  final String title;
  final String subtitle;
  final double rating;
}
