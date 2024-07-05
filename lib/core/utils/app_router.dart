import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/auth/login/presentation/views/login_view.dart';
import 'package:voyago/feature/auth/register/data/models/register_model.dart';
import 'package:voyago/feature/auth/register/data/repo/auth_register_repo_imp.dart';
import 'package:voyago/feature/auth/register/presentation/manger/register_cubit/register_cubit.dart';
import 'package:voyago/feature/auth/register/presentation/views/register_view.dart';
import 'package:voyago/feature/auth/register/presentation/views/widgets/verification_sginup_body.dart';
import 'package:voyago/feature/forgot_password/presentation/manger/codeForgotPass/code_forgot_password_cubit.dart';
import 'package:voyago/feature/forgot_password/presentation/manger/restPassword/rest_password_cubit.dart';
import 'package:voyago/feature/forgot_password/presentation/views/forgot_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/new_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/success_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/success_sginup_view.dart';
import 'package:voyago/feature/auth/register/presentation/views/verification_sginup_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/verification_code_passwordview.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';
import 'package:voyago/feature/search/presentation/views/search_view.dart';
import 'package:voyago/feature/trip&booking/presentation/views/trip_view.dart';

import '../../feature/auth/register/data/models/verification_model.dart';
import '../../feature/forgot_password/presentation/views/widgets/verification_code_body_password.dart';
import '../widgets/bottom_bar.dart';

abstract class AppRouter {
  static const kGetStartedView = "/GetStartedView";
  static const kSplashView = "/";
  static const kLoginView = "/LoginView";
  static const kRegisterView = "/RegisterView";
  static const kForgotPasswordView = "/ForgotPasswordView";
  static const kVerificationCodeView = "/VerificationCodeView";
  static const kNewPassword = "/NewPasswordView";
  static const kSuccessSginUp = "/SuccessSginUpView";
  static const kSuccessPasswor = "/SuccessPasswordView";
  static const kVerificationSginUpView = "/VerificationSginUpView";
  static const kHomeView = "/HomeView";
  static const kTripDetailsView = "/TripDetailsView";
  static const kSearchView = "/SearchView";
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
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(getIt.get<AuthRepoImp>()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      // GoRoute(
      //     path: kVerificationCodeView,
      //     builder: (context, state) {

      //       return BlocProvider(
      //         create: (context) => CodeForgotPasswordCubit(getIt.get<RegisterRepoImp>()),
      //         child: const VerificationCodeView(

      //         ),
      //   );
      //    }),

//8
      GoRoute(
        path: kVerificationCodeView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                CodeForgotPasswordCubit(getIt.get<AuthRepoImp>()),
            child: VerificationCodeView(), // تمرير البريد الإلكتروني
          );
        },
      ),

      GoRoute(
        path: kNewPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => RestPasswordCubit(getIt.get<AuthRepoImp>()),
          child: const NewPasswordView(),
        ),
      ),
      GoRoute(
        path: kSuccessSginUp,
        builder: (context, state) => const SuccessSginUpView(),
      ),
      GoRoute(
        path: kSuccessPasswor,
        builder: (context, state) => const SuccessPasswordView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const BottomBar(),
      ),
      GoRoute(
        path: kTripDetailsView,
        builder: (context, state) => const TripView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
