import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/core/apis/api_executor/api_executor.dart';
import 'package:reco_genie_intern_task/core/apis/api_result/api_result.dart';
import 'package:reco_genie_intern_task/features/auth/data/firebase_services/auth_service.dart';

import 'package:reco_genie_intern_task/features/auth/data/models/auth_request.dart';
import 'package:reco_genie_intern_task/features/auth/data/models/user_dm.dart';

import '../../../../core/utils/app_constants.dart';
import '../datasource_contract/auth_remote_datasource.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthDataSourceImpl implements AuthRemoteDataSource {
  final AuthService _authService;
  final FirebaseFirestore _fireStore;

  AuthDataSourceImpl(this._authService, this._fireStore);

  CollectionReference<UserModel> _getUserCollection() {
    return _fireStore
        .collection(AppConstants.firebaseUserCollection)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (userDto, options) {
            return userDto.toJson();
          },
        );
  }

  @override
  Future<ApiResult<UserModel>> login(AuthRequest authRequest) async {
    var result = await ApiExecutor.executeApi(
      () => _authService.login(authRequest),
    );
    switch (result) {
      case Success<UserCredential>():
        return Success(data: UserModel.fromUserCredential(result.data));
      case Error<UserCredential>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<UserModel>> register(AuthRequest authRequest) async {
    var result = await ApiExecutor.executeApi(
      () => _authService.register(authRequest),
    );
    switch (result) {
      case Success<UserCredential>():
        await _getUserCollection()
            .doc(result.data.user!.uid)
            .set(UserModel.fromUserCredential(result.data));
        return Success(data: UserModel.fromUserCredential(result.data));
      case Error<UserCredential>():
        return Error(error: result.error);
    }
  }
}
