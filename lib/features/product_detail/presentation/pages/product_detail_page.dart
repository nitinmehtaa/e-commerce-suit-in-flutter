import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/data/providers/product_providers.dart';
import 'package:flutter_app_tablayout/design_system/atoms/product_image.dart';
import 'package:flutter_app_tablayout/domain/entities/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  const ProductDetailPage({super.key, required this.productId});

  final int productId;

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productDetailProvider(widget.productId));
    return productAsync.when(
      data: (product) => _ProductDetailScaffold(
        product: product,
        selectedColorIndex: _selectedColorIndex,
        selectedSizeIndex: _selectedSizeIndex,
        quantity: _quantity,
        onColorChanged: (index) => setState(() => _selectedColorIndex = index),
        onSizeChanged: (index) => setState(() => _selectedSizeIndex = index),
        onQuantityChanged: (value) => setState(() => _quantity = value.clamp(1, 99)),
      ),
      loading: () => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'Unable to load product details.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}

class _ProductDetailScaffold extends StatefulWidget {
  const _ProductDetailScaffold({
    required this.product,
    required this.selectedColorIndex,
    required this.selectedSizeIndex,
    required this.quantity,
    required this.onColorChanged,
    required this.onSizeChanged,
    required this.onQuantityChanged,
  });

  final Product product;
  final int selectedColorIndex;
  final int selectedSizeIndex;
  final int quantity;
  final ValueChanged<int> onColorChanged;
  final ValueChanged<int> onSizeChanged;
  final ValueChanged<int> onQuantityChanged;

  @override
  State<_ProductDetailScaffold> createState() => _ProductDetailScaffoldState();
}

class _ProductDetailScaffoldState extends State<_ProductDetailScaffold> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final imageUrls = widget.product.imageUrls.isEmpty
        ? [widget.product.thumbnailUrl]
        : widget.product.imageUrls;
    final sizeOptions = widget.product.variants.isEmpty
        ? _defaultSizeVariants(widget.product)
        : widget.product.variants;
    final selectedSize = sizeOptions[widget.selectedSizeIndex.clamp(0, sizeOptions.length - 1)];
    final colorOptions = widget.product.colorOptions.isEmpty
        ? const ['Black', 'Gray', 'White']
        : widget.product.colorOptions;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroImage(
                imageUrl: imageUrls.first,
                onBack: () => context.pop(),
                isFavorite: _isFavorite,
                onFavorite: () => setState(() => _isFavorite = !_isFavorite),
              ),
              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title.isEmpty
                          ? 'Light Dress Bless'
                          : widget.product.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F1F1F),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _RatingRow(
                    rating: widget.product.rating,
                    reviewCount: widget.product.reviewCount,
                  ),
                  _QuantitySelector(
                    quantity: widget.quantity,
                    onChanged: widget.onQuantityChanged,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  text: widget.product.description.isEmpty
                      ? 'It\'s simple and elegant shape makes it perfect for '
                          'those of you who like minimalist clothes'
                      : widget.product.description,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: Color(0xFF8B8B8B),
                  ),
                  children: const [
                    TextSpan(
                      text: ' Read More...',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Choose Size',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F1F1F),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(
                            sizeOptions.length,
                            (index) => _SizeOptionChip(
                              label: sizeOptions[index].label,
                              selected: index == widget.selectedSizeIndex,
                              onTap: () => widget.onSizeChanged(index),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Color',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F1F1F),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: List.generate(
                          colorOptions.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
                            child: _ColorDot(
                              color: _colorFromLabel(colorOptions[index]),
                              selected: index == widget.selectedColorIndex,
                              onTap: () => widget.onColorChanged(index),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomActionBar(
        price: selectedSize.price,
        originalPrice: selectedSize.originalPrice,
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage({
    required this.imageUrl,
    required this.onBack,
    required this.onFavorite,
    this.isFavorite = false,
  });

  final String imageUrl;
  final VoidCallback onBack;
  final VoidCallback onFavorite;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: ProductImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        Positioned(
          top: 14,
          left: 14,
          child: _CircularIconButton(
            icon: Icons.arrow_back,
            onTap: onBack,
          ),
        ),
        Positioned(
          top: 14,
          right: 14,
          child: _CircularIconButton(
            icon: isFavorite ? Icons.favorite : Icons.favorite_border,
            onTap: onFavorite,
            isFilled: isFavorite,
          ),
        ),
      ],
    );
  }
}

class _CircularIconButton extends StatelessWidget {
  const _CircularIconButton({
    required this.icon,
    required this.onTap,
    this.isFilled = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 36,
          width: 36,
          child: Icon(
            icon,
            size: 18,
            color: const Color(0xFF1F1F1F),
          ),
        ),
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow({
    required this.rating,
    required this.reviewCount,
  });

  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, size: 14, color: Color(0xFFFFC107)),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F1F1F),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '(${_formatReviewCount(reviewCount)} reviews)',
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF8B8B8B),
          ),
        ),
      ],
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  const _QuantitySelector({
    required this.quantity,
    required this.onChanged,
  });

  final int quantity;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuantityButton(
          icon: Icons.remove,
          onTap: () => onChanged(quantity > 1 ? quantity - 1 : 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            quantity.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        _QuantityButton(
          icon: Icons.add,
          onTap: () => onChanged(quantity + 1),
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF3F3F3),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 30,
          width: 30,
          child: Icon(icon, size: 16, color: const Color(0xFF1F1F1F)),
        ),
      ),
    );
  }
}

class _SizeOptionChip extends StatelessWidget {
  const _SizeOptionChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1F1F1F) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xFF1F1F1F) : const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : const Color(0xFF1F1F1F),
          ),
        ),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot({
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? const Color(0xFF1F1F1F) : Colors.transparent,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  const _BottomActionBar({
    required this.price,
    required this.originalPrice,
  });

  final double price;
  final double originalPrice;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 6, 20, 12),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2B2B2B),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_bag_outlined, size: 18),
                const SizedBox(width: 8),
                const Text(
                  'Add to Cart',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 4),
                const Text(
                  '|',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '\$${_formatPrice(price)}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                if (originalPrice > price) ...[
                  const SizedBox(width: 8),
                  Text(
                    '\$${_formatPrice(originalPrice)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFBDBDBD),
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<ProductVariant> _defaultSizeVariants(Product product) {
  return [
    ProductVariant(label: 'S', price: product.price, originalPrice: product.originalPrice),
    ProductVariant(label: 'M', price: product.price, originalPrice: product.originalPrice),
    ProductVariant(label: 'L', price: product.price, originalPrice: product.originalPrice),
    ProductVariant(label: 'XL', price: product.price, originalPrice: product.originalPrice),
  ];
}

String _formatPrice(double value) => value.toStringAsFixed(2);

String _formatCount(int value) {
  if (value >= 100000) {
    final short = (value / 100000).toStringAsFixed(1);
    return '${short}L+';
  }
  if (value >= 1000) {
    final short = (value / 1000).toStringAsFixed(1);
    return '${short}K+';
  }
  return value.toString();
}

String _formatReviewCount(int value) {
  // Format with K+ notation for thousands
  if (value >= 1000) {
    final double short = value / 1000;
    if (short % 1 == 0) {
      return '${short.toInt()}K+';
    }
    return '${short.toStringAsFixed(1)}K+';
  }
  return value.toString();
}

Color _colorFromLabel(String label) {
  final lower = label.toLowerCase();
  if (lower.contains('green')) return const Color(0xFF5DB075);
  if (lower.contains('blue')) return const Color(0xFF64B5F6);
  if (lower.contains('black')) return const Color(0xFF2F2F2F);
  if (lower.contains('graphite') || lower.contains('gray')) {
    return const Color(0xFF757575);
  }
  if (lower.contains('red')) return const Color(0xFFE57373);
  if (lower.contains('silver')) return const Color(0xFFB0BEC5);
  if (lower.contains('white')) return const Color(0xFFF5F5F5);
  if (lower.contains('pink')) return const Color(0xFFF8BBD0);
  return const Color(0xFF90CAF9);
}
