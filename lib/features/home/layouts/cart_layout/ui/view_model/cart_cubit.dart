import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/entities/cart_item_entity.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/use_cases/add_to_cart_use_case.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/use_cases/clear_cart_use_case.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/use_cases/delete_from_cart_use_case.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/use_cases/get_cart_items_use_case.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/use_cases/update_cart_use_case.dart';

import '../../../../../../core/apis/api_result/api_result.dart';

part 'cart_state.dart';

@LazySingleton()
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._addToCartUseCase,
    this._getCartItemsUseCase,
    this._updateCartUseCase,
    this._deleteFromCartUseCase,
    this._clearCartUseCase,
  ) : super(CartState());
  final AddToCartUseCase _addToCartUseCase;
  final GetCartItemsUseCase _getCartItemsUseCase;
  final UpdateCartUseCase _updateCartUseCase;
  final DeleteFromCartUseCase _deleteFromCartUseCase;
  final ClearCartUseCase _clearCartUseCase;

  void doIntent(CartIntent intent) {
    switch (intent) {
      case AddToCart():
        _addToCart(intent.cartModel);
      case GetCartItems():
        _getCartItems();
      case RemoveFromCart():
        _deleteFromCart(intent.cartItem);
      case ClearCart():
        _clearCart();
      case UpdateCart():
        _updateCartQuantity(intent.cartItem);
      case CounterIncrement():
        _incrementQuantity(intent.price);
      case CounterDecrement():
        _decrementQuantity(intent.price);
    }
  }

  void _incrementQuantity(int price) {
    emit(
      state.copyWith(
        cartCounter: CartCounter.increment,
        totalPrice: state.totalPrice + price,
      ),
    );
  }

  void _decrementQuantity(int price) {
    emit(
      state.copyWith(
        cartCounter: CartCounter.decrement,
        totalPrice: state.totalPrice - price,
      ),
    );
  }

  void _addToCart(CartModelEntity cartModel) async {
    emit(state.copyWith(addToCart: Status.loading));
    var result = await _addToCartUseCase.execute(cartModel);
    switch (result) {
      case Success<void>():
        emit(state.copyWith(addToCart: Status.success));
      case Error<void>():
        emit(
          state.copyWith(addToCart: Status.error, addToCartError: result.error),
        );
    }
  }

  void _getCartItems() async {
    emit(state.copyWith(getCartItems: Status.loading));
    var result = await _getCartItemsUseCase.execute();
    switch (result) {
      case Success<List<CartItemEntity>>():
        int totalPrice = _getTotalPrice(result.data);
        emit(
          state.copyWith(
            getCartItems: Status.success,
            cartItems: result.data,
            totalPrice: totalPrice,
          ),
        );
      case Error<List<CartItemEntity>>():
        emit(
          state.copyWith(
            getCartItems: Status.error,
            getCartItemsError: result.error,
          ),
        );
    }
  }

  void _updateCartQuantity(CartItemEntity cartItem) async {
    emit(state.copyWith(updateCartQuantity: Status.loading));
    var result = await _updateCartUseCase.execute(cartItem);
    switch (result) {
      case Success<void>():
        emit(state.copyWith(updateCartQuantity: Status.success));
      case Error<void>():
        emit(
          state.copyWith(
            updateCartQuantity: Status.error,
            updateCartQuantityError: result.error,
          ),
        );
    }
  }

  void _deleteFromCart(CartItemEntity cartItem) async {
    emit(state.copyWith(deleteFromCart: Status.loading));
    var result = await _deleteFromCartUseCase.call(cartItem);
    switch (result) {
      case Success<List<CartItemEntity>>():
        emit(
          state.copyWith(
            deleteFromCart: Status.success,
            cartItems: result.data,
          ),
        );
      case Error<List<CartItemEntity>>():
        emit(
          state.copyWith(
            deleteFromCart: Status.error,
            deleteFromCartError: result.error,
          ),
        );
    }
  }

  void _clearCart() async {
    emit(state.copyWith(clearCart: Status.loading));
    var result = await _clearCartUseCase.execute();
    switch (result) {
      case Success<void>():
        _getCartItems();
        emit(state.copyWith(clearCart: Status.success));
      case Error<void>():
        emit(
          state.copyWith(clearCart: Status.error, clearCartError: result.error),
        );
    }
  }

  int _getTotalPrice(List<CartItemEntity> list) {
    int totalPrice = 0;
    for (var item in list) {
      totalPrice += int.parse(item.price) * item.quantity;
    }
    return totalPrice;
  }
}

sealed class CartIntent {}

class AddToCart extends CartIntent {
  final CartModelEntity cartModel;

  AddToCart(this.cartModel);
}

class GetCartItems extends CartIntent {}

class RemoveFromCart extends CartIntent {
  CartItemEntity cartItem;

  RemoveFromCart(this.cartItem);
}

class ClearCart extends CartIntent {}

class UpdateCart extends CartIntent {
  CartItemEntity cartItem;

  UpdateCart(this.cartItem);
}

class CounterIncrement extends CartIntent {
  int price;

  CounterIncrement(this.price);
}

class CounterDecrement extends CartIntent {
  int price;

  CounterDecrement(this.price);
}
