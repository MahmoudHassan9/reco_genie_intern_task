part of 'cart_cubit.dart';

enum Status { initial, loading, success, error }

enum CartCounter { increment, decrement }

class CartState extends Equatable {
  final Status addToCart;
  final Object? addToCartError;
  final Status getCartItems;
  final CartCounter? cartCounter;
  final int totalPrice;
  final List<CartItemEntity>? cartItems;
  final Object? getCartItemsError;
  final Status updateCartQuantity;
  final Object? updateCartQuantityError;
  final Status deleteFromCart;
  final Object? deleteFromCartError;
  final Status clearCart;
  final Object ? clearCartError;


  const CartState({
    this.addToCart = Status.initial,
    this.cartItems,
    this.addToCartError,
    this.getCartItems = Status.initial,
    this.getCartItemsError,
    this.cartCounter,
    this.totalPrice = 0,
    this.updateCartQuantity = Status.initial,
    this.updateCartQuantityError,
    this.deleteFromCart = Status.initial,
    this.deleteFromCartError,
    this.clearCart = Status.initial,
    this.clearCartError,
  });

  CartState copyWith({
    Status? addToCart,
    List<CartItemEntity>? cartItems,
    Object? addToCartError,
    Status? getCartItems,
    Object? getCartItemsError,
    CartCounter? cartCounter,
    int? totalPrice,
    Status? updateCartQuantity,
    Object? updateCartQuantityError,
    Status? deleteFromCart,
    Object? deleteFromCartError,
    Status? clearCart,
    Object? clearCartError
  }) {
    return CartState(
      addToCart: addToCart ?? this.addToCart,
      cartItems: cartItems ?? this.cartItems,
      addToCartError: addToCartError ?? this.addToCartError,
      getCartItems: getCartItems ?? this.getCartItems,
      getCartItemsError: getCartItemsError ?? this.getCartItemsError,
      cartCounter: cartCounter ?? this.cartCounter,
      totalPrice: totalPrice ?? this.totalPrice,
      updateCartQuantity: updateCartQuantity ?? this.updateCartQuantity,
      updateCartQuantityError:
          updateCartQuantityError ?? this.updateCartQuantityError,
      deleteFromCart: deleteFromCart ?? this.deleteFromCart,
      deleteFromCartError: deleteFromCartError ?? this.deleteFromCartError,
      clearCart: clearCart ?? this.clearCart,
      clearCartError: clearCartError ?? this.clearCartError
    );
  }

  @override
  List<Object?> get props => [
    addToCart,
    cartItems,
    addToCartError,
    getCartItems,
    getCartItemsError,
    cartCounter,
    totalPrice,
    updateCartQuantity,
    updateCartQuantityError,
    deleteFromCart,
    deleteFromCartError,
    clearCart,
    clearCartError
  ];
}
