import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';

void main() {
  runApp(const VoyagoApp());
}

class VoyagoApp extends StatelessWidget {
  const VoyagoApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(

          textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme)),

      home: const GetStarted(),
    );
  }
}
