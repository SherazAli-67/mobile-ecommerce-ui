import 'package:go_router/go_router.dart';
import 'package:mobile_ecommerce_ui/core/app_data.dart';
import 'package:mobile_ecommerce_ui/core/models/product_model.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/home_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/providers/product_detail_provider.dart';
import 'package:mobile_ecommerce_ui/presentation/screens/checkout_screen.dart';
import 'package:mobile_ecommerce_ui/presentation/screens/favorite_screen.dart';
import 'package:mobile_ecommerce_ui/presentation/screens/home_screen.dart';
import 'package:mobile_ecommerce_ui/presentation/screens/product_detail_screen.dart';
import 'package:mobile_ecommerce_ui/presentation/screens/profile_screen.dart';
import 'package:provider/provider.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.home.routeName,
  routes: [
    GoRoute(
      path: NamedRoutes.home.routeName,
      builder: (ctx, state) => ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: NamedRoutes.productDetail.routeName,
      builder: (ctx, state) {
        final product = _resolveProduct(state);
        return ChangeNotifierProvider(
          create: (_) => ProductDetailProvider(product: product),
          child: const ProductDetailScreen(),
        );
      },
    ),
    GoRoute(
      path: NamedRoutes.checkout.routeName,
      builder: (ctx, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: NamedRoutes.favorite.routeName,
      builder: (ctx, state) => const FavoriteScreen(),
    ),
    GoRoute(
      path: NamedRoutes.profile.routeName,
      builder: (ctx, state) => const ProfileScreen(),
    ),
  ],
);

ProductModel _resolveProduct(GoRouterState state) {
  final extra = state.extra;
  if (extra is ProductDetailRouteArgs) return extra.product;
  if (extra is ProductModel) return extra;
  final productId = state.pathParameters['id'];
  return AppData.products.firstWhere(
    (product) => product.id == productId,
    orElse: () => AppData.products.first,
  );
}

enum NamedRoutes {
  home('/home'),
  productDetail('/product/:id'),
  checkout('/checkout'),
  favorite('/favorite'),
  profile('/profile');

  final String routeName;
  const NamedRoutes(this.routeName);

  String location({String? id}) {
    if (this == NamedRoutes.productDetail && id != null) return '/product/$id';
    return routeName;
  }
}
