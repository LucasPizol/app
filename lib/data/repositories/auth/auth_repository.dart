import 'package:app/models/user.dart';

abstract class AuthRepositoryImpl {
  Future<User> signInWithGoogle();
  Future<void> signOut();
}
