import 'package:app/data/repositories/auth/auth_repository_remote.dart';
import 'package:app/data/services/google_auth.dart';
import 'package:app/data/services/http.dart';
import 'package:app/routes/destination.dart';
import 'package:app/ui/confirmacao_cadastro/widgets/confirmacao_cadastro_page.dart';
import 'package:app/ui/core/themes/app_colors.dart';
import 'package:app/ui/core/themes/font.dart';
import 'package:app/ui/intro/view_model/intro_view_model.dart';
import 'package:app/ui/intro/widgets/intro_page.dart';
import 'package:app/ui/libras/view_model/libras_view_model.dart';
import 'package:app/ui/libras/widgets/libras_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'routes.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.intro,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.intro,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create:
              (context) => IntroViewModel(
                authRepository: AuthRepositoryRemote(
                  googleAuth: GoogleAuth(),
                  httpService: HttpService(),
                ),
              ),
          child: IntroPage(),
        );
      },
    ),
    GoRoute(
      path: Routes.confirmacaoCadastro,
      builder: (context, state) {
        return ConfirmacaoCadastroPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        const destinations = [
          Destination(label: 'Tradução', icon: Icons.translate),
          Destination(label: 'Libras', icon: Icons.sign_language_outlined),
          Destination(label: 'Educação', icon: Icons.school),
          Destination(label: 'Conta', icon: Icons.person_outline),
        ];

        return Scaffold(
          body: SafeArea(child: navigationShell),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStateTextStyle.resolveWith((
                Set<WidgetState> states,
              ) {
                final bool isSelected = states.contains(WidgetState.selected);

                final Color color =
                    isSelected ? AppColors.white : AppColors.disabledIcon;

                final FontWeight fontWeight =
                    isSelected ? FontWeight.w700 : FontWeight.w400;

                return Font.primary(
                  color: color,
                  fontWeight: fontWeight,
                  fontSize: 12,
                );
              }),
            ),
            child: NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: navigationShell.goBranch,
              backgroundColor: AppColors.primary400,
              indicatorColor: AppColors.primary400,
              destinations:
                  destinations
                      .map(
                        (destination) => NavigationDestination(
                          icon: Icon(
                            destination.icon,
                            color: AppColors.disabledIcon,
                            size: 30,
                          ),
                          label: destination.label,
                          selectedIcon: Icon(
                            destination.icon,
                            color: AppColors.white,
                            size: 30,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => Text('Tradução'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.libras,
              builder:
                  (context, state) => ChangeNotifierProvider(
                    create: (context) => LibrasViewModel(),
                    child: LibrasPage(),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.educacao,
              builder: (context, state) => Text('Educação'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.conta,
              builder: (context, state) => Text('Conta'),
            ),
          ],
        ),
      ],
    ),
  ],
);
