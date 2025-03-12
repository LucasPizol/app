import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleAuthImpl {
  Future<void> signIn() async {}
}

class GoogleAuth extends GoogleAuthImpl {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> signIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}
