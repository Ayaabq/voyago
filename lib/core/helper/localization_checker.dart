import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_router.dart';

class LocalizationChecker {
  static changeLanguage(BuildContext context, Locale locale) {
    Locale? currentLocale = context.locale;
    if (currentLocale != locale) {
      context.setLocale(locale);
    }
    GoRouter.of(context).push(AppRouter.kHomeView);
  }


}
