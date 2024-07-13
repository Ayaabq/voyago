import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/services_locater.dart';

import 'package:voyago/feature/forgot_password/presentation/views/forgot_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/new_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/success_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/success_sginup_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/verification_code_passwordview.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';
import 'package:voyago/feature/profile/presentation/views/edit_profile_view.dart';
import 'package:voyago/feature/search/presentation/views/search_view.dart';
import 'package:voyago/feature/trip&booking/presentation/views/reviews_view.dart';
import 'package:voyago/feature/trip&booking/presentation/views/checkout_view.dart';
import 'package:voyago/feature/trip&booking/presentation/views/trip_view.dart';
import 'package:voyago/feature/wallet/presentation/views/fill_wallet.dart';
import 'package:voyago/feature/wallet/presentation/views/wallet_view.dart';

import '../../constants.dart';
import '../../feature/auth/login/presentation/views/login_view.dart';
import '../../feature/auth/register/data/repo/auth_register_repo_imp.dart';
import '../../feature/auth/register/presentation/manger/register_cubit/register_cubit.dart';
import '../../feature/auth/register/presentation/views/register_view.dart';
import '../../feature/forgot_password/presentation/manger/codeForgotPass/code_forgot_password_cubit.dart';
import '../../feature/forgot_password/presentation/manger/restPassword/rest_password_cubit.dart';
import '../../feature/profile/presentation/views/personal_info_view.dart';
import '../widgets/bottom_bar.dart';

class AppRouter {
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
  static const kReviewsView = "/ReviewsView";
  static const kCheckoutView = "/CheckoutView";

  ///*****          profile     **** */
  static const kPersonalInformationView = "/PersonalInformationView";
  static const kEditProfileView = "/EditProfileView";
  static const kWalletView = "/WalletView";
  static const kFillWalletView = "/FillWalletView";

//// ****** //////////////////////////////
  static final router = GoRouter(
    initialLocation: initial,
    routes: [
      GoRoute(
        path: kGetStartedView,
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

      GoRoute(
        path: kVerificationCodeView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                CodeForgotPasswordCubit(getIt.get<AuthRepoImp>()),
            child: const VerificationCodeView(),
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
      GoRoute(
        path: kReviewsView,
        builder: (context, state) => const ReviewView(),
      ),
      GoRoute(
        path: kCheckoutView,
        builder: (context, state) => const CheckoutScreen(),
      ),

// **** profile ***////

      GoRoute(
        path: kPersonalInformationView,
        builder: (context, state) => const PersonalInformationView(),
      ),

      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kWalletView,
        builder: (context, state) => const WalletView(),
      ),
      GoRoute(
        path: kFillWalletView,
        builder: (context, state) => const FillWalletView(),
      ),
    ],
  );
}
