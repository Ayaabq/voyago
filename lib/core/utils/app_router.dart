import 'package:go_router/go_router.dart';


abstract class AppRouter {

  static const kOnboardingView = "/OnBoarding";
  static const kSplashView = "/";
  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: kSplashView,
      //   builder: (ctx, state) => const SplashView(),
      // ),
      // GoRoute(
      //   path: kOnboardingView,
      //   builder: (ctx, state) => const HomeView(),
      // ),

    ],
  );
}
