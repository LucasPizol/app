import 'package:app/ui/confirmacao_cadastro/widgets/confirmacao_cadastro_page.dart';
import 'package:app/ui/intro/widgets/intro_page.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.intro,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: Routes.intro,
          builder: (context, state) {
            return ConfirmacaoCadastroPage();
          },
        ),
      ],
    );
