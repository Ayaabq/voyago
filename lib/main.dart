import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyago/core/utils/screen_size_util.dart';

import 'core/utils/app_router.dart';

void main() {
  runApp(const VoyagoApp());
}

class VoyagoApp extends StatelessWidget {
  const VoyagoApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData.light().copyWith(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.light().textTheme)),

      // home: const GetStarted(),
    );
  }
}
