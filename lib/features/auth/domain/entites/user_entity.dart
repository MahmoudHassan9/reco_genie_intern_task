import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String id;

  const UserEntity({required this.email, required this.id});

  @override
  List<Object?> get props => [email, id];
}
