import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_tablayout/design_system/molecules/promo_card.dart';
import 'package:flutter_app_tablayout/design_system/organisms/deals_section.dart';
import 'package:flutter_app_tablayout/domain/entities/product.dart';

void main() {
  testWidgets('Deals section shows content and taps',
      (WidgetTester tester) async {
    var tapped = false;
    final products = const [
      Product(
        id: 1,
        title: 'Sample Phone',
        description: '',
        thumbnailUrl: '',
        price: 499,
        rating: 4.5,
        category: 'smartphones',
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: DealsSection(
          title: 'New Launches',
          viewAllLabel: 'View All',
          products: products,
          onViewAll: () => tapped = true,
          onProductTap: (_) {},
        ),
      ),
    );

    expect(find.text('New Launches'), findsOneWidget);
    expect(find.text('View All'), findsOneWidget);
    expect(find.text('Sample Phone'), findsOneWidget);

    await tester.tap(find.text('View All'));
    expect(tapped, isTrue);
  });

  testWidgets('Promo card shows campaign copy',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PromoCard(
          title: 'Premium Sports Shoes',
          subtitle: 'Up to 60% Off',
          imageAsset: 'lib/assets/sports shoes.png',
          onTap: () {},
        ),
      ),
    );

    expect(find.text('Premium Sports Shoes'), findsOneWidget);
    expect(find.text('Up to 60% Off'), findsOneWidget);
  });
}
