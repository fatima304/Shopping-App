import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';
import '../blocs/locale/locale_cubit.dart';
import '../blocs/product/product_cubit.dart';
import '../blocs/theme/theme_bloc.dart';
import '../blocs/theme/theme_event.dart';
import '../l10n/app_localizations.dart';
import '../models/product_model.dart';
import '../utils/app_routes.dart';
import '../widgets/banner_page_view.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void _add(BuildContext context, ProductModel product) {
    context.read<CartBloc>().add(AddToCart(product));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.addedToCart),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.home),
        actions: [
          IconButton(
            tooltip: l.language,
            onPressed: () => context.read<LocaleCubit>().toggle(),
            icon: const Icon(Icons.language),
          ),
          IconButton(
            tooltip: l.theme,
            onPressed: () => context.read<ThemeBloc>().add(const ToggleTheme()),
            icon: const Icon(Icons.brightness_6_outlined),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) => Badge(
              isLabelVisible: state.count > 0,
              label: Text('${state.count}'),
              child: IconButton(
                tooltip: l.cart,
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading || state is ProductInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductError)
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(l.networkError, textAlign: TextAlign.center),
                  ),
                  FilledButton(
                    onPressed: () =>
                        context.read<ProductCubit>().loadProducts(),
                    child: Text(l.retry),
                  ),
                ],
              ),
            );
          final loaded = state as ProductLoaded;
          final products = loaded.products;
          if (products.isEmpty) return Center(child: Text(l.noProducts));
          final width = MediaQuery.sizeOf(context).width;
          final padding = width > 700 ? 28.0 : 16.0;
          final cardWidth = (width - padding * 2 - 14) / 2;
          final aspect = (cardWidth / 260).clamp(0.57, 0.94).toDouble();
          return RefreshIndicator(
            onRefresh: () => context.read<ProductCubit>().loadProducts(),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.featured,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        BannerPageView(products: products),
                        if (loaded.fromCache)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(l.cachedNotice),
                          ),
                        const SizedBox(height: 24),
                        Text(
                          l.allProducts,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(padding, 0, padding, 24),
                  sliver: SliverGrid.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: aspect,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.details,
                          arguments: product,
                        ),
                        onAdd: () => _add(context, product),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
