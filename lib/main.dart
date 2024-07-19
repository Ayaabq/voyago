import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/utils/screen_size_util.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/core/utils/storge_token.dart';
import 'package:voyago/feature/auth/login/presentation/views/login_view.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/destination_details_view.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';

import 'core/utils/app_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 2));
  // things to do when the splash is viewing
  // dynamic hasToken = await AppStorage.instance.isReadData(AppStorage.TOKEN);
  // if (hasToken) initial = AppRouter.kHomeView;
  FlutterNativeSplash.remove();
  setUpServiceLocater();
  runApp(const VoyagoApp());
}

class VoyagoApp extends StatelessWidget {
  const VoyagoApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return
          MaterialApp.router(
          debugShowCheckedModeBanner: false,
        
          routerConfig: AppRouter.router,
          theme: ThemeData.light().copyWith(

            textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
          ),
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
