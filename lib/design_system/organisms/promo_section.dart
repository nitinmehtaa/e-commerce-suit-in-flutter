import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/design_system/molecules/promo_card.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String imageAsset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: PromoCard(
        title: title,
        subtitle: subtitle,
        imageAsset: imageAsset,
        onTap: onTap,
      ),
    );
  }
}
