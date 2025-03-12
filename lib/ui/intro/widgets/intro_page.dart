import 'package:app/ui/core/shared/flat_button.dart';
import 'package:app/ui/core/shared/primary_button.dart';
import 'package:app/ui/core/shared/secondary_button.dart';
import 'package:app/ui/core/themes/font.dart';
import 'package:app/ui/intro/view_model/intro_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/ui/core/themes/colors.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final List<String> _titles = [
    'Um tradutor em tempo real conectando pessoas de várias linguas.',
    'Com a inclusão de linguagens de sinais para expandir sua conexão.',
    'Garanta conhecimento em diversas línguas a partir de planos de estudos.',
  ];

  final List<Widget> items =
      [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/carousel_$i.png'),
                ),
              ),
            );
          },
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: SafeArea(
        child: Consumer<IntroViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: double.infinity,
                          autoPlay: true,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            viewModel.onPageChanged(index);
                          },
                        ),
                        items: items,
                      ),
                      Positioned(
                        top: 14,
                        left: 14,
                        child: Image.asset('assets/images/Logo.png'),
                      ),
                    ],
                  ),
                ),
                FractionalTranslation(
                  translation: Offset(0, -0.025),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary100,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withAlpha(130),
                          spreadRadius: 1,
                          blurRadius: 22,
                        ),
                        BoxShadow(
                          color: AppColors.primary100,
                          spreadRadius: 1,
                          offset: Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        AnimatedSmoothIndicator(
                          activeIndex: viewModel.currentIndex,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            spacing: 8.0,
                            radius: 40,
                            dotWidth: 8,
                            dotHeight: 8,
                            dotColor: AppColors.grey,
                            activeDotColor: AppColors.primary400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            Text(
                              _titles[viewModel.currentIndex],
                              style: Font.primary(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Escolha uma opção para continuar',
                              style: Font.primary(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            PrimaryButton(
                              rounded: true,
                              disabled: viewModel.isGoogleLoading,
                              onPressed: () {
                                Navigator.of(context).pushNamed('/cadastro');
                              },
                              text: 'Criar conta',
                            ),
                            const SizedBox(height: 16),
                            SecondaryButton(
                              rounded: true,
                              disabled: viewModel.isGoogleLoading,
                              onPressed: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              text: 'Entrar',
                            ),
                            const SizedBox(height: 32),
                            FlatButton(
                              loading: viewModel.isGoogleLoading,
                              onPressed: () {
                                viewModel.signInWithGoogle();
                              },
                              text: 'Entrar com o Google',
                              leftIcon: SvgPicture.asset(
                                'assets/images/icons/google.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
