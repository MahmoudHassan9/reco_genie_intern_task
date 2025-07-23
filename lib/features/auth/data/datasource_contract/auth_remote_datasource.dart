import 'package:reco_genie_intern_task/core/apis/api_result/api_result.dart';
import 'package:reco_genie_intern_task/features/auth/data/models/auth_request.dart';

import '../models/user_dm.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResult<UserModel>> login(AuthRequest authRequest);

  Future<ApiResult<UserModel>> register(AuthRequest authRequest);
}
