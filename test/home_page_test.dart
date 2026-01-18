import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_tablayout/data/providers/product_providers.dart';
import 'package:flutter_app_tablayout/features/home/presentation/pages/home_page.dart';
import 'package:flutter_app_tablayout/features/common/presentation/pages/new_page.dart';
import 'package:go_router/go_router.dart';

import 'support/fake_product_repository.dart';
import 'support/test_app.dart';

void main() {
  Widget _buildHome() {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(
          path: '/electronics',
          builder: (context, state) => const NewPage('Electronics'),
        ),
        GoRoute(
          path: '/lifestyle',
          builder: (context, state) => const NewPage('Lifestyle'),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NewPage('Notifications'),
        ),
        GoRoute(path: '/cart', builder: (context, state) => const NewPage('Cart')),
        GoRoute(
          path: '/account',
          builder: (context, state) => const NewPage('Account'),
        ),
      ],
    );

    return buildTestApp(
      child: const HomePage(),
      router: router,
      overrides: [
        productRepositoryProvider.overrideWithValue(FakeProductRepository()),
      ],
    );
  }

  testWidgets('Home page shows greeting header',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildHome());

    await tester.pumpAndSettle();
    expect(find.text('Hello, Welcome'), findsOneWidget);
    expect(find.text('Albert Stevano'), findsOneWidget);
  });

  testWidgets('Home page search field navigates to notifications',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildHome());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Search clothes...'));
    await tester.pumpAndSettle();
    expect(find.text('Notifications'), findsOneWidget);
  });
}
