import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/ai_assistent/presentation/views/ai_view.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/attraction/presentation/views/widgets/attraction_details.dart';
import 'package:voyago/feature/destination/data/models/destination_model.dart';

import 'package:voyago/feature/forgot_password/presentation/views/forgot_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/new_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/success_password_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/success_sginup_view.dart';
import 'package:voyago/feature/forgot_password/presentation/views/verification_code_passwordview.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';
import 'package:voyago/feature/location&map/presentation/views/widgets/location_input.dart';
import 'package:voyago/feature/notification/presentation/views/notification_view.dart';

import 'package:voyago/feature/profile/presentation/views/edit_profile_view.dart';
import 'package:voyago/feature/search/presentation/views/attraction_search.dart';

import 'package:voyago/feature/search/presentation/views/search_view.dart';
import 'package:voyago/feature/search/presentation/views/trip_searc.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/reviews/reviews_view.dart';
import 'package:voyago/feature/trip&booking/presentation/views/trip_view.dart';
import 'package:voyago/feature/wallet/data/models/history_wallet.dart';
import 'package:voyago/feature/wallet/data/repo/wallet_repo_impl.dart';
import 'package:voyago/feature/wallet/presentation/views/detiles_wallet_history.dart';
import 'package:voyago/feature/wallet/presentation/views/fill_wallet.dart';
import 'package:voyago/feature/wallet/presentation/views/hestory_wallet.dart';
import 'package:voyago/feature/wallet/presentation/views/wallet_view.dart';

import '../../constants.dart';
import '../../feature/auth/login/presentation/views/login_view.dart';
import '../../feature/auth/register/data/repo/auth_register_repo_imp.dart';
import '../../feature/auth/register/presentation/manger/register_cubit/register_cubit.dart';
import '../../feature/auth/register/presentation/views/register_view.dart';
import '../../feature/books/presentation/views/widgets/detiles_books_view.dart';
import '../../feature/destination/presentation/views/widgets/destination_details_view.dart';
import '../../feature/forgot_password/presentation/manger/codeForgotPass/code_forgot_password_cubit.dart';
import '../../feature/forgot_password/presentation/manger/restPassword/rest_password_cubit.dart';

import '../../feature/profile/presentation/views/help_view.dart';
import '../../feature/profile/presentation/views/personal_info_view.dart';
import '../../feature/profile/presentation/views/setting_view.dart';
import '../../feature/review_profile/presention/views/reviews_view.dart';
import '../../feature/trip&booking/presentation/views/checkout_view.dart';
import '../../feature/wallet/presentation/manger/detiles_wallet/cubit/detiles_wallet_cubit.dart';
import '../widgets/bottom_bar.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
  static const kAiView = "/kAiView";
  static const kNotificationView = "/kNotificationView";

  ///*****          profile     **** */
  static const kPersonalInformationView = "/PersonalInformationView";
  static const kEditProfileView = "/EditProfileView";

  static const kSettingsView = "/SettingsView";
  static const kHelpView = "/HelpView";
  static const kReviewsProfileView = "/ReviewsProfileView";

  ///*****          destination     *****///
  static const kDestinationDetailsView = "/DestinationDetailsView";

  ///*****          attraction     *****///
  static const kAttractionDetailsView = "/AttractionDetailsView";
  ///*****          search     *****///
  static const kAttractionSearch = "/AttractionSearchView";
  static const kTripSearch = "/TripSearchView";


////******     wallet               ****** */
  static const kWalletView = "/WalletView";
  static const kFillWalletView = "/FillWalletView";
  static const kHistoryWalletView = "/HistoryWalletView";
  static const kDetilesWaletHistoryView = "/DetilesWaletHistoryView";

//***   books */
  static const kDetilesBooksView = "/DetilesBooksView";
  //// ***location*** /////
  static const kLocationView = "/kLocationView";

//// ****** //////////////////////////////
  //// ***location*** /////

  static final router = GoRouter(
    navigatorKey: navigatorKey,
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
        builder: (context, state) {
          final TripModel trip =
              state.extra as TripModel; // Cast the extra to Trip
          return TripView(
              tripModel: trip); // Pass the Trip model to the TripView
        },
      ),

      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          final type = (state.extra) as String;

          return SearchView(
            type: type,
          );
        },
      ),
      GoRoute(
        path: kReviewsView,
        builder: (context, state) {
          final List<String> url = state.extra as List<String>;
          return ReviewView(
            url: url[0],
            addUrl: url[1],
          );
        },
      ),
      GoRoute(
        path: kCheckoutView,
        builder: (context, state) {
          final trip = state.extra as TripModel;

          return CheckoutView(
            tripModel: trip,
          );
        },
      ),

// **** profile   &  wallet  ***////

      GoRoute(
        path: kPersonalInformationView,
        builder: (context, state) => const PersonalInformationView(),
      ),

      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kReviewsProfileView,
        builder: (context, state) => const ReviewsView(),
      ),

      // **** destination ***////
      GoRoute(
        path: kDestinationDetailsView,
        builder: (context, state) {
          final DestinationModel destination =
              state.extra as DestinationModel; //
          return DestinationDetailsView(
            destinationModel: destination,
          );
        },
      ),

////*****           wallet      ***** */
      GoRoute(
        path: kWalletView,
        builder: (context, state) => const WalletView(),
      ),
      GoRoute(
        path: kFillWalletView,
        builder: (context, state) => const FillWalletView(),
      ),
      GoRoute(
        path: kHistoryWalletView,
        builder: (context, state) => const HistoryWalletView(),
      ),
      GoRoute(
          path: kDetilesWaletHistoryView,
          builder: (context, state) {
            final HistoryWalletModel model = state.extra as HistoryWalletModel;
            return BlocProvider(
              create: (context) => TransactionCubit(getIt.get<WalletRepoImpl>()),
              child: DetilesWaletHistoryView(
                id: model,
              ),
            );
          }),

      /// ** attraction** ///
      GoRoute(
        path: kAttractionDetailsView,
        builder: (context, state) {
          final AttractionModel attraction =
              state.extra as AttractionModel; // Cast the extra to Trip
          return AttractionDetailsView(
            attraction: attraction,
          ); // Pass the Trip model to the TripView
        },
      ),
      GoRoute(
        path: kSettingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: kHelpView,
        builder: (context, state) => const HelpView(),
      ),

/* ///  books    /// */
      GoRoute(
        path: kDetilesBooksView,
        builder: (context, state) => const DetilesBooksView(),
      ),
      GoRoute(
        path: '$kLocationView/:lat/:lng',
        builder: (context, state) {
          final lat = double.parse(state.pathParameters['lat']!);
          final lng = double.parse(state.pathParameters['lng']!);
          final title= state.extra as String;
          return  LocationInput(lat: lat,long: lng, title: title,);
        },
      ),
      GoRoute(
        path: kAiView,
        builder: (context, state) {
          return const AiView();
        },
      ),
      GoRoute(
        path: kNotificationView,
        builder: (context, state) {
          return const NotificationView();
        },
      ), GoRoute(
        path: kTripSearch,
        builder: (context, state) {
          return const TripSearch();
        },
      ),GoRoute(
        path: kAttractionSearch,
        builder: (context, state) {
          return const AttractionSearch();
        },
      ),
    ],
  );
}
