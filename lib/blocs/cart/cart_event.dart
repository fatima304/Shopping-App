import '../../models/product_model.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddToCart extends CartEvent {
  const AddToCart(this.product);
  final ProductModel product;
}

class RemoveFromCart extends CartEvent {
  const RemoveFromCart(this.productId);
  final int productId;
}

class ClearCart extends CartEvent {
  const ClearCart();
}
