import 'package:app/data/services/google_auth.dart';
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
            var googleAuth = GoogleAuth();

            return IntroPage(
              googleAuth: googleAuth,
            );
          },
        ),
      ],
    );
