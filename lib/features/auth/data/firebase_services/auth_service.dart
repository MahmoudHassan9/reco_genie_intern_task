import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth_request.dart';

abstract interface class AuthService {
  Future<UserCredential> login(AuthRequest authRequest);

  Future<UserCredential> register(AuthRequest authRequest);
}
