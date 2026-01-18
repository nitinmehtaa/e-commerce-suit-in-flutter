import 'package:flutter_app_tablayout/features/cart/presentation/pages/checkout_page.dart';
import 'package:flutter_app_tablayout/features/common/presentation/pages/new_page.dart';
import 'package:flutter_app_tablayout/features/home/presentation/pages/home_page.dart';
import 'package:flutter_app_tablayout/features/product_detail/presentation/pages/product_detail_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/category/:id',
        builder: (context, state) {
          final id = Uri.decodeComponent(state.pathParameters['id'] ?? '');
          return NewPage('Category: $id');
        },
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '');
          if (id == null) {
            return const NewPage('Product');
          }
          return ProductDetailPage(productId: id);
        },
      ),
      GoRoute(
        path: '/section/:title',
        builder: (context, state) {
          final title = Uri.decodeComponent(state.pathParameters['title'] ?? '');
          return NewPage(title.isEmpty ? 'Section' : title);
        },
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NewPage('Notifications'),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => const NewPage('Account'),
      ),
      GoRoute(
        path: '/lifestyle',
        builder: (context, state) => const NewPage('Lifestyle'),
      ),
      GoRoute(
        path: '/electronics',
        builder: (context, state) => const NewPage('Electronics'),
      ),
    ],
  );
}
