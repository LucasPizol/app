import 'package:app/src/pages/intro_page.dart';
import 'package:flutter/material.dart';

class AppHandu extends StatelessWidget {
  const AppHandu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: Column(
          children: [IntroPage()],
        ),
      ),
    );
  }
}