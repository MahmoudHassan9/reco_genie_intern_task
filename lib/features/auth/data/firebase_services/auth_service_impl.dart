import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/features/auth/data/models/auth_request.dart';
import 'auth_service.dart';

@Injectable(as: AuthService)
class AuthServiceImpl implements AuthService {
  FirebaseAuth firebaseAuth;

  AuthServiceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> login(AuthRequest authRequest) {
    return firebaseAuth.signInWithEmailAndPassword(
      email: authRequest.email,
      password: authRequest.password,
    );
  }

  @override
  Future<UserCredential> register(AuthRequest authRequest) {
    return firebaseAuth.createUserWithEmailAndPassword(
      email: authRequest.email,
      password: authRequest.password,
    );
  }
}
