import 'package:equatable/equatable.dart';
import '../../../domain/entites/user_entity.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final UserEntity? userEntity;
  final Object? loginError;

  const LoginState({
    this.status = LoginStatus.initial,
    this.userEntity,
    this.loginError,
  });

  LoginState copyWith({
    LoginStatus? status,
    UserEntity? userEntity,
    Object? loginError,
  }) {
    return LoginState(
      status: status ?? this.status,
      userEntity: userEntity ?? this.userEntity,
      loginError: loginError ?? this.loginError,
    );
  }

  @override
  List<Object?> get props => [status, userEntity, loginError];
}
