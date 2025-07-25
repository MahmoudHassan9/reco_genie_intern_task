import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/auth_request.dart';
import '../../../domain/entites/user_entity.dart';
import '../../../domain/use_cases/login_usecase.dart';
import 'login_state.dart';
@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginState());
  final LoginUseCase _loginUseCase;

  void doIntent(LoginIntent intent) {
    switch (intent) {
      case OnLoginButtonClicked():
        _login(intent.authRequest);
    }
  }

  void _login(AuthRequest authRequest) async {
    emit(state.copyWith(status: LoginStatus.loading));
    var result = await _loginUseCase.execute(authRequest);
    switch (result) {
      case Success<UserEntity>():
        emit(
          state.copyWith(status: LoginStatus.success, userEntity: result.data),
        );
      case Error<UserEntity>():
        emit(
          state.copyWith(status: LoginStatus.error, loginError: result.error),
        );
    }
  }
}

sealed class LoginIntent {}

class OnLoginButtonClicked extends LoginIntent {
  AuthRequest authRequest;

  OnLoginButtonClicked(this.authRequest);
}
