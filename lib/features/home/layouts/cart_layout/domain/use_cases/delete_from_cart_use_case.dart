import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/repo_contract/cart_repo.dart';

import '../../../../../../core/apis/api_result/api_result.dart';
import '../entities/cart_item_entity.dart';
@injectable
class DeleteFromCartUseCase {
  final CartRepo _cartRepo;

  DeleteFromCartUseCase(this._cartRepo);

  Future<ApiResult<List<CartItemEntity>>> call(CartItemEntity cartItem) => _cartRepo.removeFromCart(cartItem);
}