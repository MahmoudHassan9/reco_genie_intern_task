import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @lazySingleton
  FirebaseAuth firebaseAuthInstance() => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore fireStoreInstance() => FirebaseFirestore.instance;
}
