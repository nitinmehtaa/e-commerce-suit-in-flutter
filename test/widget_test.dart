import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_tablayout/data/providers/product_providers.dart';
import 'package:flutter_app_tablayout/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import 'support/fake_product_repository.dart';
import 'support/test_app.dart';

void main() {
  testWidgets('Home screen renders app title', (WidgetTester tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
      ],
    );

    await tester.pumpWidget(
      buildTestApp(
        child: const HomePage(),
        router: router,
        overrides: [
          productRepositoryProvider.overrideWithValue(FakeProductRepository()),
        ],
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('Shoppy'), findsOneWidget);
  });
}
