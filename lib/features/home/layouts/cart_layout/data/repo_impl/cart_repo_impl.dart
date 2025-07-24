import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/core/apis/api_result/api_result.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/data/datasource_contract/cart_remote_datasource.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/entities/cart_item_entity.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/repo_contract/cart_repo.dart';

import '../models/cart_model.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepoImpl(this._cartRemoteDataSource);

  @override
  Future<ApiResult<void>> addToCart(CartModelEntity cartModel) async {
    var result = await _cartRemoteDataSource.addToCart(cartModel.toCartModel());
    switch (result) {
      case Success<void>():
        return Success(data: null);
      case Error<void>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<void>> clearCart() {
    return _cartRemoteDataSource.clearCart();
  }

  @override
  Future<ApiResult<List<CartItemEntity>>> getCartItems() async {
    var result = await _cartRemoteDataSource.getCartItems();
    switch (result) {
      case Success<List<CartItem>>():
        return Success(data: result.data.map((e) => e.toEntity()).toList());
      case Error<List<CartItem>>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<List<CartItemEntity>>> removeFromCart(
    CartItemEntity cartItem,
  ) async {
    var result = await _cartRemoteDataSource.removeFromCart(
      cartItem.toCartItem(),
    );
    switch (result) {
      case Success<List<CartItem>>():
        return Success(data: result.data.map((e) => e.toEntity()).toList());
      case Error<List<CartItem>>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<void>> updateCart(CartItemEntity cartItem) {
    return _cartRemoteDataSource.updateCart(cartItem.toCartItem());
  }
}
