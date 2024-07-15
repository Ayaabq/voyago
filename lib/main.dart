import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:voyago/core/utils/screen_size_util.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:voyago/core/utils/services_locater.dart';

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

      // home: const GetStarted(),
    );
    // MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //
    // theme: ThemeData.light().copyWith(
    //       textTheme:
    //           GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
    //     ),
    //   home: DestinationDetailsView(),
    //
    // );
  }
}
