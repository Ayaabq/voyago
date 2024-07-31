
//new and

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import '../../../../core/utils/storge_token.dart';

enum AppTheme { light, dark }

class ThemeCubit extends Cubit<ThemeData> with WidgetsBindingObserver {
  ThemeCubit() : super(_lightTheme) {
    _loadTheme();
    WidgetsBinding.instance.addObserver(this);
  }

  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "montserrat",
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    cardColor: CustomColors.kWhite[2],
    appBarTheme: const AppBarTheme(color: Colors.white),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
    dialogBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: CustomColors.kMove[0],
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "montserrat",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color(0xff2e2e2e),
    cardColor: const Color(0xff595959),
    appBarTheme: const AppBarTheme(color: Color(0xff282828)),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: CustomColors.kMove[0],
    ),
    dialogBackgroundColor: const Color(0xff373737),
    tabBarTheme: const TabBarTheme(),
  );

  void toggleTheme() async {
    if (state.brightness == Brightness.light) {
      emit(_darkTheme);
      await AppStorage.instance.writeData(AppStorage.THEME, 'dark');
    } else {
      emit(_lightTheme);
      await AppStorage.instance.writeData(AppStorage.THEME, 'light');
    }
  }

  Future<void> _loadTheme() async {
    final theme = await AppStorage.instance.readData(AppStorage.THEME);
    if (theme == 'dark') {
      emit(_darkTheme);
    } else {
      emit(_lightTheme);
    }
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
    updateSystemTheme(brightness);
  }

  void updateSystemTheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      emit(_darkTheme);
    } else {
      emit(_lightTheme);
    }
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}

