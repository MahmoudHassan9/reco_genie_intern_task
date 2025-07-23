import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/entities/cart_item_entity.dart';

import '../../../../../../core/apis/api_result/api_result.dart';

abstract interface class CartRepo {
  Future<ApiResult<List<CartItemEntity>>> getCartItems();

  Future<ApiResult<void>> addToCart(CartModelEntity cartModel);

  Future<ApiResult<void>> removeFromCart(CartItemEntity cartItem);

  Future<ApiResult<void>> updateCart(CartItemEntity cartItem);

  Future<ApiResult<void>> clearCart();
}
