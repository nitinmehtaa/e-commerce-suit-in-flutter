import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_tablayout/data/providers/product_providers.dart';
import 'package:flutter_app_tablayout/features/home/presentation/widgets/feed_body.dart';
import 'package:flutter_app_tablayout/features/common/presentation/pages/new_page.dart';
import 'package:go_router/go_router.dart';

import 'support/fake_product_repository.dart';
import 'support/test_app.dart';

void main() {
  testWidgets('Feed body shows search and loads products',
      (WidgetTester tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const FeedBody()),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NewPage('Notifications'),
        ),
      ],
    );

    await tester.pumpWidget(
      buildTestApp(
        child: const FeedBody(),
        router: router,
        overrides: [
          productRepositoryProvider.overrideWithValue(FakeProductRepository()),
        ],
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Search clothes...'), findsOneWidget);

    await tester.tap(find.text('Search clothes...'));
    await tester.pumpAndSettle();
    expect(find.text('Notifications'), findsOneWidget);
  });
}
