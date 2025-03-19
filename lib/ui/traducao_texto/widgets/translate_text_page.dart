import 'package:app/ui/core/shared/background.dart';
import 'package:app/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TranslateTextPage extends StatelessWidget {
  const TranslateTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(          
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.1, 1.5),
            colors: <Color>[AppColors.primary500, AppColors.primary100],
          ),
        ),
        child: Row(
          children: [

            Text('OBA')
          ],
        ),
      ),
    );
  }
}
