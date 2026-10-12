import '../../models/cart_item_model.dart';

class CartState {
  const CartState({this.items = const [], this.lastAction = CartAction.none});
  final List<CartItemModel> items;
  final CartAction lastAction;
  double get totalPrice => items.fold(0, (sum, item) => sum + item.subtotal);
  int get count => items.fold(0, (sum, item) => sum + item.quantity);
}

enum CartAction { none, added, removed, emptied }
