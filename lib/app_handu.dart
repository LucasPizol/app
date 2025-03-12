import 'package:app/routes/router.dart';
import 'package:app/ui/core/themes/font.dart';
import 'package:flutter/material.dart';

class AppHandu extends StatelessWidget {
  const AppHandu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(textTheme: Font.primaryTheme()),
      routerConfig: router(),
    );
  }
}
