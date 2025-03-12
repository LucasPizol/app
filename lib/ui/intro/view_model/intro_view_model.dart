import 'package:app/data/repositories/auth/auth_repository.dart';
import 'package:flutter/material.dart';

class IntroViewModel extends ChangeNotifier {
  final AuthRepositoryImpl _authRepository;

  bool isGoogleLoading = false;

  IntroViewModel({required AuthRepositoryImpl authRepository})
    : _authRepository = authRepository;

  int _currentIndex = 0;
  final List<String> _titles = [
    'Um tradutor em tempo real conectando pessoas de várias linguas.',
    'Com a inclusão de linguagens de sinais para expandir sua conexão.',
    'Garanta conhecimento em diversas línguas a partir de planos de estudos.',
  ];

  int get currentIndex => _currentIndex;
  String get title => _titles[_currentIndex];

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      isGoogleLoading = true;
      notifyListeners();

      await _authRepository.signInWithGoogle();
    } catch (e) {
      print(e);
    } finally {
      isGoogleLoading = false;
      notifyListeners();
    }
  }
}
