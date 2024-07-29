import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizationChecker {
  static changeLanguage(BuildContext context, Locale locale) {
    Locale? currentLocale = context.locale;
    if (currentLocale != locale) {
      context.setLocale(locale);
    }
  }
}
