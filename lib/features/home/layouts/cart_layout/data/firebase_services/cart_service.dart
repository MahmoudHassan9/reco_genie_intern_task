import '../models/cart_model.dart';

abstract class CartService {
  Future<List<CartItem>> getCartItems();

  Future<void> addToCart(CartModel cartItem);

  Future<void> updateCart(CartItem cartItem);

  Future<void> removeFromCart(CartItem cartItem);

  Future<void> clearCart();
}
