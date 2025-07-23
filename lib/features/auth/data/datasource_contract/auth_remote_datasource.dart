import 'package:reco_genie_intern_task/core/apis/api_result/api_result.dart';
import 'package:reco_genie_intern_task/features/auth/data/models/auth_request.dart';
import 'package:reco_genie_intern_task/features/auth/domain/entites/user_entity.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResult<UserEntity>> login(AuthRequest authRequest);

  Future<ApiResult<UserEntity>> register(AuthRequest authRequest);
}
