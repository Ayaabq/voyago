import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'toast.dart';



class ToastManager {
  final FToast _fToast;

  ToastManager(BuildContext context) : _fToast = FToast() {
    _fToast.init(context);
  }

  void showTopToast({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    final toastWidget = ToastWidget(
      title: title,
      description: description,
      icon: icon,
      color: color,
    );

    _fToast.showToast(

      child: toastWidget,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
