import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_item_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    // Each event produces a new immutable list so BlocBuilder updates correctly.
    on<AddToCart>((event, emit) {
      final items = [...state.items];
      final index = items.indexWhere(
        (item) => item.product.id == event.product.id,
      );
      if (index < 0) {
        items.add(CartItemModel(product: event.product, quantity: 1));
      } else {
        items[index] = items[index].copyWith(
          quantity: items[index].quantity + 1,
        );
      }
      emit(CartState(items: items, lastAction: CartAction.added));
    });
    on<RemoveFromCart>((event, emit) {
      final items = state.items
          .where((item) => item.product.id != event.productId)
          .toList();
      if (items.length == state.items.length) return;
      emit(
        CartState(
          items: items,
          lastAction: items.isEmpty ? CartAction.emptied : CartAction.removed,
        ),
      );
    });
    on<ClearCart>((event, emit) {
      if (state.items.isNotEmpty)
        emit(const CartState(lastAction: CartAction.emptied));
    });
  }
}
