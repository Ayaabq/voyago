import 'package:go_router/go_router.dart';
import 'package:voyago/feature/auth/presentation/views/login_view.dart';
import 'package:voyago/feature/auth/presentation/views/register_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/forgot_password.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';

abstract class AppRouter {
  static const kGetStartedView = "/GetStartedView";
  static const kSplashView = "/";
  static const kLoginView = "/LoginView";
  static const kRegisterView = "/RegisterView";
  static const kForgotPasswordView = "/ForgotPasswordView";
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
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
    ],
  );
}
