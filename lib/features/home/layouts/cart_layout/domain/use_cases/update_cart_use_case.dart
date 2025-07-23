import 'package:injectable/injectable.dart';

import '../../../../../../core/apis/api_result/api_result.dart';
import '../entities/cart_item_entity.dart';
import '../repo_contract/cart_repo.dart';

@injectable
class UpdateCartUseCase {
  final CartRepo cartRepo;

  UpdateCartUseCase(this.cartRepo);

  Future<ApiResult<void>> execute(CartItemEntity cartItem) =>
      cartRepo.updateCart(cartItem);
}
