import 'package:injectable/injectable.dart';

import '../../../../../../core/apis/api_result/api_result.dart';
import '../entities/cart_item_entity.dart';
import '../repo_contract/cart_repo.dart';

@injectable
class AddToCartUseCase {
  final CartRepo _cartRepo;

  AddToCartUseCase(this._cartRepo);

  Future<ApiResult<void>> execute(CartModelEntity cartModel) =>
      _cartRepo.addToCart(cartModel);
}
