import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/features/auth/domain/auth_repo/auth_repo.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../../data/models/auth_request.dart';
import '../entites/user_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  Future<ApiResult<UserEntity>> execute(AuthRequest authRequest) =>
      _authRepo.login(authRequest);
}
