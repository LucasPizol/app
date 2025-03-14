import 'package:app/data/repositories/auth/auth_repository.dart';
import 'package:app/models/user.dart';
import 'package:flutter/material.dart';

abstract class AuthProviderImpl extends ChangeNotifier {
  Future<void> signInWithGoogle();
  Future<void> signOut();
}

class AuthProvider extends ChangeNotifier implements AuthProviderImpl {
  final AuthRepositoryImpl _authRepository;

  AuthProvider({required AuthRepositoryImpl authRepository})
    : _authRepository = authRepository;

  User? _user;
  bool _isGoogleLoading = false;
  bool _isLoading = false;

  bool get isAuthenticated => _user != null;
  User? get user => _user;
  bool get isGoogleLoading => _isGoogleLoading;
  bool get isLoading => _isLoading;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 2));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      _isGoogleLoading = true;
      notifyListeners();

      User user = await _authRepository.signInWithGoogle();

      _user = user;
      notifyListeners();
    } finally {
      _isGoogleLoading = false;
      notifyListeners();
    }
  }

  @override
  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}
