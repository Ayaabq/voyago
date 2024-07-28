import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyago/core/utils/screen_size_util.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:voyago/core/utils/services_locater.dart';

import 'core/utils/app_router.dart';
import 'feature/favorite/data/repo/favorite_repo_impl.dart';
import 'feature/favorite/presentation/manager/change_favorite_cubit/favorite_cubit.dart';
import 'feature/location&map/data/repo/location_repo.dart';
import 'feature/location&map/presentation/manager/location_cubit.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 2));

  // things to do when the splash is viewing
  // dynamic hasToken = await AppStorage.instance.isReadData(AppStorage.TOKEN);
  // if (hasToken) initial = AppRouter.kHomeView;
  FlutterNativeSplash.remove();
  setUpServiceLocater();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: Locale('en'),
      child: const VoyagoApp()));
}

class VoyagoApp extends StatelessWidget {
  const VoyagoApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ChangeFavoriteCubit(getIt.get<FavoriteRepoImp>()),
          ),
          BlocProvider(
            create: (context) => LocationCubit(getIt<LocationRepo>()),
          )
        ],
        child: MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: ThemeData.light().copyWith(
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
          ),
        )

        //
        //   // home: const GetStarted(),
        // );
        // MaterialApp(
        //     debugShowCheckedModeBanner: false,
        //     theme: ThemeData.light().copyWith(
        //       textTheme:
        //           GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
        //     ),
        //     home: const LoginView()
        // DestinationDetailsView(),

        );
  }
}
