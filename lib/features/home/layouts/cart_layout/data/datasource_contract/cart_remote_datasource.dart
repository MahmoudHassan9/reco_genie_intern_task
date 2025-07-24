import 'package:reco_genie_intern_task/core/apis/api_result/api_result.dart';

import '../models/cart_model.dart';

abstract interface class CartRemoteDataSource {
  Future<ApiResult<List<CartItem>>> getCartItems();

  Future<ApiResult<void>> addToCart(CartModel cartModel);

  Future<ApiResult<List<CartItem>>> removeFromCart(CartItem cartModel);

  Future<ApiResult<void>> updateCart(CartItem cartModel);

  Future<ApiResult<void>> clearCart();
}
