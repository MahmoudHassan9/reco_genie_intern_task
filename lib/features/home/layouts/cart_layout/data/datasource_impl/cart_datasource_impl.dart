import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/core/apis/api_executor/api_executor.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/data/firebase_services/cart_service.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/data/models/cart_model.dart';

import '../../../../../../core/apis/api_result/api_result.dart';
import '../datasource_contract/cart_remote_datasource.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final CartService _cartService;

  CartRemoteDataSourceImpl(this._cartService);

  @override
  Future<ApiResult<void>> addToCart(CartModel cartModel) async {
    var result = await ApiExecutor.executeApi(
      () => _cartService.addToCart(cartModel),
    );
    switch (result) {
      case Success<void>():
        return Success(data: null);
      case Error<void>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<void>> clearCart() async {
    var result = await ApiExecutor.executeApi(() => _cartService.clearCart());
    switch (result) {
      case Success<void>():
        return Success(data: null);
      case Error<void>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<List<CartItem>>> getCartItems() async {
    var result = await ApiExecutor.executeApi(
      () => _cartService.getCartItems(),
    );
    switch (result) {
      case Success<List<CartItem>>():
        return Success(data: result.data);
      case Error<List<CartItem>>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<List<CartItem>>> removeFromCart(CartItem cartModel) async {
    var result = await ApiExecutor.executeApi(
      () => _cartService.removeFromCart(cartModel),
    );
    switch (result) {
      case Success<List<CartItem>>():
        return Success(data: result.data);
      case Error<List<CartItem>>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<void>> updateCart(CartItem cartModel) async {
    var result = await ApiExecutor.executeApi(
      () => _cartService.updateCart(cartModel),
    );
    switch (result) {
      case Success<void>():
        return Success(data: null);
      case Error<void>():
        return Error(error: result.error);
    }
  }
}
