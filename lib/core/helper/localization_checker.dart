import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationChecker {
  static changeLanguage(BuildContext context, Locale locale) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal != locale) {
      EasyLocalization.of(context)!.setLocale(locale);
    }
  }
}