import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/toast/toast_manger.dart';

extension ToastExtensions on BuildContext {
  void showLoadingToast() {
    ToastManager(this).showTopToast(
      title: 'Loading',
      description: 'Please wait',
      icon: Icons.hourglass_empty,
      color: Colors.blue,
    );
  }

  void showSuccessToast(String message) {
    ToastManager(this).showTopToast(
      title: 'Success',
      description: message,
      icon: Icons.check_circle,
      color: Colors.green,
    );
  }

  void showFailureToast(String message) {
    ToastManager(this).showTopToast(
      title: 'Failure',
      description: message,
      icon: Icons.error,
      color: Colors.red,
    );
  }

  void showErrorToast() {
    ToastManager(this).showTopToast(
      title: 'Error',
      description: 'Oops, there was an error. Please try again',
      icon: Icons.error_outline,
      color: Colors.orange,
    );
  }
}
