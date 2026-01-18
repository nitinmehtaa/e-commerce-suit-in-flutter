import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppAssets {
  const AppAssets({
    required this.promoImageAsset,
    required this.heroImageUrls,
  });

  final String promoImageAsset;
  final List<String> heroImageUrls;
}

class AppCopy {
  const AppCopy({
    required this.appName,
    required this.searchHint,
    required this.newLaunchesTitle,
    required this.viewAllLabel,
    required this.promoTitle,
    required this.promoSubtitle,
    required this.drawerHeaderName,
    required this.drawerHeaderEmail,
  });

  final String appName;
  final String searchHint;
  final String newLaunchesTitle;
  final String viewAllLabel;
  final String promoTitle;
  final String promoSubtitle;
  final String drawerHeaderName;
  final String drawerHeaderEmail;
}

enum AppBrandPreset { quickCommerce, luxury }

class AppNavItem {
  const AppNavItem({
    required this.label,
    required this.icon,
    this.route,
  });

  final String label;
  final IconData icon;
  final String? route;
}

class AppActionItem {
  const AppActionItem({
    required this.icon,
    required this.route,
  });

  final IconData icon;
  final String route;
}

class AppConfig {
  const AppConfig({
    required this.preset,
    required this.themeMode,
    required this.copy,
    required this.assets,
    required this.drawerItems,
    required this.appBarActions,
  });

  final AppBrandPreset preset;
  final ThemeMode themeMode;
  final AppCopy copy;
  final AppAssets assets;
  final List<AppNavItem> drawerItems;
  final List<AppActionItem> appBarActions;

  factory AppConfig.quickCommerce() {
    return const AppConfig(
      preset: AppBrandPreset.quickCommerce,
      themeMode: ThemeMode.system,
      copy: AppCopy(
        appName: 'Shoppy',
        searchHint: 'Search for Products, Brands and More',
        newLaunchesTitle: 'New Launches',
        viewAllLabel: 'View All',
        promoTitle: 'Premium Sports Shoes',
        promoSubtitle: 'Up to 60% Off',
        drawerHeaderName: 'Store Admin',
        drawerHeaderEmail: 'brand.account@example.com',
      ),
      assets: AppAssets(
        promoImageAsset: 'lib/assets/sports shoes.png',
        heroImageUrls: [
          'https://images.unsplash.com/photo-1520588831435-1529e6d7cf5e?auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1542356805-7ac8780a5349?auto=format&fit=crop&w=525&q=60',
          'https://images.unsplash.com/photo-1521020773588-3b28297b1e70?auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1513043069934-38cc6da2ea9f?auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1513373319109-eb154073eb0b?auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1520006403909-838d6b92c22e?auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1538411393449-2910995cfa42?auto=format&fit=crop&w=525&q=60',
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=500&q=60',
        ],
      ),
      drawerItems: [
        AppNavItem(label: 'Electronics', icon: Icons.phone_iphone, route: '/electronics'),
        AppNavItem(label: 'Lifestyle', icon: Icons.face, route: '/lifestyle'),
        AppNavItem(label: 'TVs and Appliances', icon: Icons.home),
        AppNavItem(label: 'Sports, Books & More', icon: Icons.store),
        AppNavItem(label: 'Offer Zone', icon: Icons.local_offer),
        AppNavItem(label: 'My Cart', icon: Icons.shopping_cart, route: '/cart'),
        AppNavItem(label: 'My Wishlist', icon: Icons.favorite),
        AppNavItem(label: 'My Orders', icon: Icons.account_balance_wallet),
        AppNavItem(label: 'My Account', icon: Icons.account_box, route: '/account'),
        AppNavItem(label: 'Logout', icon: Icons.remove_circle_outline),
        AppNavItem(label: 'About us', icon: Icons.info),
      ],
      appBarActions: [
        AppActionItem(icon: Icons.notifications, route: '/notifications'),
        AppActionItem(icon: Icons.shopping_cart, route: '/cart'),
        AppActionItem(icon: Icons.account_circle, route: '/account'),
      ],
    );
  }

  factory AppConfig.luxury() {
    return const AppConfig(
      preset: AppBrandPreset.luxury,
      themeMode: ThemeMode.light,
      copy: AppCopy(
        appName: 'Maison',
        searchHint: 'Search curated collections',
        newLaunchesTitle: 'New Arrivals',
        viewAllLabel: 'Explore',
        promoTitle: 'Signature Collection',
        promoSubtitle: 'Limited Edition',
        drawerHeaderName: 'Maison Concierge',
        drawerHeaderEmail: 'client.services@example.com',
      ),
      assets: AppAssets(
        promoImageAsset: 'lib/assets/sports shoes.png',
        heroImageUrls: [
          'https://images.unsplash.com/photo-1520588831435-1529e6d7cf5e?auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1542356805-7ac8780a5349?auto=format&fit=crop&w=525&q=60',
        ],
      ),
      drawerItems: [
        AppNavItem(label: 'Collections', icon: Icons.shopping_bag_outlined),
        AppNavItem(label: 'Tailored', icon: Icons.chair_outlined),
        AppNavItem(label: 'Lookbook', icon: Icons.auto_stories_outlined),
        AppNavItem(label: 'Client Services', icon: Icons.support_agent),
      ],
      appBarActions: [
        AppActionItem(icon: Icons.notifications_none, route: '/notifications'),
        AppActionItem(icon: Icons.shopping_bag_outlined, route: '/cart'),
        AppActionItem(icon: Icons.account_circle_outlined, route: '/account'),
      ],
    );
  }
}

final appConfigProvider = Provider<AppConfig>((ref) {
  return AppConfig.quickCommerce();
});
