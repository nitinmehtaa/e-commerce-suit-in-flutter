import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/design_system/atoms/label_chip.dart';
import 'package:flutter_app_tablayout/domain/entities/category.dart';

class CategoriesStrip extends StatelessWidget {
  const CategoriesStrip({
    super.key,
    required this.categories,
    required this.onCategoryTap,
    this.backgroundColor,
  });

  final List<Category> categories;
  final ValueChanged<Category> onCategoryTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: backgroundColor ?? Theme.of(context).colorScheme.primary,
      height: 56,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return LabelChip(
            label: category.title,
            icon: Icons.local_offer_outlined,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            onTap: () => onCategoryTap(category),
          );
        },
      ),
    );
  }
}
