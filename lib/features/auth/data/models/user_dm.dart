import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reco_genie_intern_task/features/auth/domain/entites/user_entity.dart';

class UserModel extends Equatable {
  final String? email;
  final String? id;

  const UserModel({this.email, this.id});

  factory UserModel.fromUserCredential(UserCredential userCredential) =>
      UserModel(
        email: userCredential.user?.email,
        id: userCredential.user?.uid,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(email: json['email'], id: json['id']);

  Map<String, dynamic> toJson() => {'email': email, 'id': id};

  UserEntity toEntity() => UserEntity(email: email ?? '', id: id ?? '');

  @override
  List<Object?> get props => [email, id];
}
