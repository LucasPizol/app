import 'package:app/ui/core/shared/flat_button.dart';
import 'package:app/ui/core/shared/primary_button.dart';
import 'package:app/ui/core/shared/secondary_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CarouselSlider(
          options: CarouselOptions(height: 400.0),
          items: [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/carousel_$i.png'))),
                );
              },
            );
          }).toList(),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              PrimaryButton(
                rounded: true,
                onPressed: () {
                  Navigator.of(context).pushNamed('/cadastro');
                },
                text: 'Criar conta',
              ),
              const SizedBox(height: 16),
              SecondaryButton(
                rounded: true,
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                text: 'Entrar',
              ),
              const SizedBox(height: 16),
              FlatButton(
                onPressed: () {},
                text: 'Entrar com o Google',
                leftIcon: SvgPicture.asset('images/icons/google.svg'),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
