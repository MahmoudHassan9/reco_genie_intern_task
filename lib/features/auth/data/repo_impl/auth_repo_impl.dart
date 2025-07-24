import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/core/apis/api_result/api_result.dart';
import 'package:reco_genie_intern_task/features/auth/data/datasource_contract/auth_remote_datasource.dart';

import 'package:reco_genie_intern_task/features/auth/data/models/auth_request.dart';
import 'package:reco_genie_intern_task/features/auth/data/models/user_dm.dart';

import 'package:reco_genie_intern_task/features/auth/domain/entites/user_entity.dart';

import '../../domain/auth_repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ApiResult<UserEntity>> login(AuthRequest authRequest) async {
    var result = await _authRemoteDataSource.login(authRequest);
    switch (result) {
      case Success<UserModel>():
        return Success(data: result.data.toEntity());
      case Error<UserModel>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<UserEntity>> register(AuthRequest authRequest) async {
    var result = await _authRemoteDataSource.register(authRequest);
    switch (result) {
      case Success<UserModel>():
        return Success(data: result.data.toEntity());
      case Error<UserModel>():
        return Error(error: result.error);
    }
  }
}
