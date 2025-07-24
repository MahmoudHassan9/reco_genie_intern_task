part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, error }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final UserEntity? userEntity;
  final Object? registerError;

  const RegisterState({
    this.status = RegisterStatus.initial,
     this.userEntity,
    this.registerError,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    UserEntity? userEntity,
    Object? registerError,
  }) {
    return RegisterState(
      status: status ?? this.status,
      userEntity: userEntity ?? this.userEntity,
      registerError: registerError ?? this.registerError,
    );
  }

  @override
  List<Object?> get props => [status, userEntity, registerError];
}
