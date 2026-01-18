import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/design_system/atoms/section_title.dart';

class HomeDealItem {
  const HomeDealItem({
    required this.title,
    required this.subtitle,
    required this.imageAsset,
  });

  final String title;
  final String subtitle;
  final String imageAsset;
}

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SectionTitle(title)),
        IconButton(
          onPressed: onTap,
          icon: const Icon(BootstrapIcons.arrow_right),
        ),
      ],
    );
  }
}

class HomeBannerCard extends StatelessWidget {
  const HomeBannerCard({
    super.key,
    required this.imageAsset,
    required this.onTap,
  });

  final String imageAsset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 8,
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeGridSection extends StatelessWidget {
  const HomeGridSection({
    super.key,
    required this.title,
    required this.items,
    required this.onHeaderTap,
    required this.onItemTap,
    this.backgroundColor,
  });

  final String title;
  final List<HomeDealItem> items;
  final VoidCallback onHeaderTap;
  final ValueChanged<HomeDealItem> onItemTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          HomeSectionHeader(title: title, onTap: onHeaderTap),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.95,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return HomeDealTile(
                item: item,
                onTap: () => onItemTap(item),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeHorizontalSection extends StatelessWidget {
  const HomeHorizontalSection({
    super.key,
    required this.title,
    required this.items,
    required this.onHeaderTap,
    required this.onItemTap,
    this.backgroundColor,
  });

  final String title;
  final List<HomeDealItem> items;
  final VoidCallback onHeaderTap;
  final ValueChanged<HomeDealItem> onItemTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: HomeSectionHeader(title: title, onTap: onHeaderTap),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final item = items[index];
                return SizedBox(
                  width: 150,
                  child: HomeDealTile(
                    item: item,
                    onTap: () => onItemTap(item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeDealTile extends StatelessWidget {
  const HomeDealTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  final HomeDealItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.imageAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(
                item.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
