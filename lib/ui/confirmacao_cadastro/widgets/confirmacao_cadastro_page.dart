import 'package:app/ui/core/shared/primary_button.dart';
import 'package:app/ui/core/themes/app_colors.dart';
import 'package:app/ui/core/themes/font.dart';
import 'package:flutter/material.dart';
import 'package:app/routes/routes.dart';
import 'package:go_router/go_router.dart';

class ConfirmacaoCadastroPage extends StatefulWidget {
  const ConfirmacaoCadastroPage({super.key});

  @override
  State<ConfirmacaoCadastroPage> createState() =>
      _ConfirmacaoCadastroPageState();
}

class _ConfirmacaoCadastroPageState extends State<ConfirmacaoCadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/confirmacao_cadastro.png',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: Image.asset('assets/images/Logo.png'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 64, 24, 16),
              decoration: BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'Cadastro realizado com sucesso!',
                    style: Font.primary(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Agora você pode usar os benefícios do aplicativo.',
                    style: Font.primary(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 62),
                  PrimaryButton(
                    rounded: true,
                    onPressed: () {
                      context.pushReplacement(Routes.home);
                    },
                    text: 'Ir para o aplicativo',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
