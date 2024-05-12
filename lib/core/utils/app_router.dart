import 'package:go_router/go_router.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';


abstract class AppRouter {

  static const kGetStartedView = "/GetStartedView";
  static const kSplashView = "/";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (ctx, state) => const GetStarted(),
      ),

    ],
  );
}
