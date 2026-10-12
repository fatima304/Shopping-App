import 'product_model.dart';

class CartItemModel {
  const CartItemModel({required this.product, required this.quantity});
  final ProductModel product;
  final int quantity;
  double get subtotal => product.price * quantity;
  CartItemModel copyWith({int? quantity}) =>
      CartItemModel(product: product, quantity: quantity ?? this.quantity);
}
