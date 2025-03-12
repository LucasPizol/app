import 'package:app/data/repositories/auth/auth_repository.dart';
import 'package:app/data/services/google_auth.dart';
import 'package:app/data/services/http.dart';

class AuthRepositoryRemote extends AuthRepositoryImpl {
  final GoogleAuthImpl _googleAuth;
  final HttpServiceImpl _httpService;

  AuthRepositoryRemote({
    required GoogleAuthImpl googleAuth,
    required HttpServiceImpl httpService,
  }) : _googleAuth = googleAuth,
       _httpService = httpService;

  @override
  Future<void> signInWithGoogle() async {
    var signedUser = await _googleAuth.signIn();


    if (signedUser == null) {
      throw Exception('Google sign in failed');
    }

    var authentication = await signedUser.authentication;

    var response = await _httpService.post('/authentication/google', {
      'user': {'token': authentication.idToken},
    });
  }
}
