import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/core/apis/api_result/api_result.dart';
import 'package:reco_genie_intern_task/features/auth/data/models/auth_request.dart';
import 'package:reco_genie_intern_task/features/auth/domain/entites/user_entity.dart';
import 'package:reco_genie_intern_task/features/auth/domain/use_cases/register_usecase.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(RegisterState());
  final RegisterUseCase _registerUseCase;

  void doIntent(RegisterIntent intent) {
    switch (intent) {
      case OnRegisterButtonClicked():
        _register(intent.authRequest);
    }
  }

  void _register(AuthRequest authRequest) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    var result = await _registerUseCase.execute(authRequest);
    switch (result) {
      case Success<UserEntity>():
        emit(
          state.copyWith(
            status: RegisterStatus.success,
            userEntity: result.data,
          ),
        );
      case Error<UserEntity>():
        emit(
          state.copyWith(
            status: RegisterStatus.error,
            registerError: result.error,
          ),
        );
    }
  }
}

sealed class RegisterIntent {}

class OnRegisterButtonClicked extends RegisterIntent {
  AuthRequest authRequest;

  OnRegisterButtonClicked(this.authRequest);
}
