import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/design_system/atoms/section_title.dart';
import 'package:flutter_app_tablayout/design_system/molecules/deal_card.dart';
import 'package:flutter_app_tablayout/design_system/theme/app_theme_extension.dart';
import 'package:flutter_app_tablayout/domain/entities/product.dart';

class DealsSection extends StatelessWidget {
  const DealsSection({
    super.key,
    required this.title,
    required this.products,
    required this.viewAllLabel,
    required this.onViewAll,
    required this.onProductTap,
  });

  final String title;
  final List<Product> products;
  final String viewAllLabel;
  final VoidCallback onViewAll;
  final ValueChanged<Product> onProductTap;

  @override
  Widget build(BuildContext context) {
    final extension = Theme.of(context).extension<AppThemeExtension>();
    return Container(
      color: extension?.sectionBackground ?? Colors.green,
      padding: const EdgeInsets.only(top: 6, bottom: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: SectionTitle(
                    title,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: onViewAll,
                  child: Text(viewAllLabel),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final product = products[index];
                return DealCard(
                  product: product,
                  onTap: () => onProductTap(product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
