import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';
import '../l10n/app_localizations.dart';
import '../utils/formatters.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.items.isNotEmpty &&
          current.items.isEmpty &&
          current.lastAction == CartAction.emptied,
      listener: (context, state) =>
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l.cartBecameEmpty))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l.cart),
          actions: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) => IconButton(
                tooltip: l.clearCart,
                icon: const Icon(Icons.delete_sweep_outlined),
                onPressed: state.items.isEmpty
                    ? null
                    : () => context.read<CartBloc>().add(const ClearCart()),
              ),
            ),
          ],
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.items.isEmpty)
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.shopping_bag_outlined, size: 68),
                    const SizedBox(height: 16),
                    Text(l.emptyCart),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(l.continueShopping),
                    ),
                  ],
                ),
              );
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return CartItemTile(
                        item: item,
                        onRemove: () => context.read<CartBloc>().add(
                          RemoveFromCart(item.product.id),
                        ),
                      );
                    },
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l.total,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          formatPrice(context, state.totalPrice),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
