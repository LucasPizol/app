import 'package:flutter/material.dart';

class IntroViewModel extends ChangeNotifier {
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
}
