import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/design_system/atoms/product_image.dart';
import 'package:flutter_app_tablayout/domain/entities/product.dart';

class DealCard extends StatelessWidget {
  const DealCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(top: 10),
        ),
        child: Column(
          children: <Widget>[
            ProductImage(
              imageUrl: product.thumbnailUrl,
              height: 100,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 6),
            Text(
              product.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
