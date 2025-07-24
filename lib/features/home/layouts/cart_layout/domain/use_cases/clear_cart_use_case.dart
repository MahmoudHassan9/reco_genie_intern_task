import 'package:injectable/injectable.dart';

import '../../../../../../core/apis/api_result/api_result.dart';
import '../repo_contract/cart_repo.dart';

@injectable
class ClearCartUseCase {
  final CartRepo cartRepo;

  ClearCartUseCase(this.cartRepo);

  Future<ApiResult<void>> execute() => cartRepo.clearCart();
}
