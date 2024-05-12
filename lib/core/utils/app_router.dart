import 'package:go_router/go_router.dart';
import 'package:voyago/feature/auth/presentation/views/login_view.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';

abstract class AppRouter {
  static const kGetStartedView = "/GetStartedView";
  static const kSplashView = "/";
  static const kLoginView = "/LoginView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (ctx, state) => const GetStarted(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
