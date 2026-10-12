import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';
import '../l10n/app_localizations.dart';
import '../models/product_model.dart';
import '../utils/app_routes.dart';
import '../utils/formatters.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          !identical(previous, current) &&
          current.lastAction == CartAction.added,
      listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.addedToCart),
          duration: const Duration(seconds: 1),
        ),
      ),
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(l.details),
          actions: [
            Badge(
              isLabelVisible: state.count > 0,
              label: Text('${state.count}'),
              child: IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                tooltip: l.cart,
                onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 640),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .30,
                            width: double.infinity,
                            child: Hero(
                              tag: 'product-${product.id}',
                              child: Image.network(
                                product.image,
                                fit: BoxFit.contain,
                                errorBuilder: (_, error, stack) => const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 60,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            product.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            formatPrice(context, product.price),
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Text('${l.category}: ${product.category}'),
                          const SizedBox(height: 20),
                          Text(product.description),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () =>
                        context.read<CartBloc>().add(AddToCart(product)),
                    icon: const Icon(Icons.add_shopping_cart),
                    label: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(l.addToCart),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
