import 'package:app/data/repositories/auth/auth_repository_remote.dart';
import 'package:app/data/services/google_auth.dart';
import 'package:app/data/services/http.dart';
import 'package:app/ui/intro/view_model/intro_view_model.dart';
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
        return IntroPage(
          viewModel: IntroViewModel(
            authRepository: AuthRepositoryRemote(
              googleAuth: GoogleAuth(),
              httpService: HttpService(),
            ),
          ),
        );
      },
    ),
  ],
);
