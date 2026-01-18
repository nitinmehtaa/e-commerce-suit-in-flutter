import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_tablayout/design_system/organisms/categories_strip.dart';
import 'package:flutter_app_tablayout/domain/entities/category.dart';

void main() {
  testWidgets('Categories strip renders labels and taps',
      (WidgetTester tester) async {
    var tapped = false;
    final categories = const [
      Category(id: 'smartphones', title: 'Smartphones'),
      Category(id: 'laptops', title: 'Laptops'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: CategoriesStrip(
          categories: categories,
          onCategoryTap: (_) => tapped = true,
        ),
      ),
    );

    expect(find.text('Smartphones'), findsOneWidget);
    expect(find.text('Laptops'), findsOneWidget);

    await tester.tap(find.text('Smartphones'));
    expect(tapped, isTrue);
  });
}
