import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/widgets/dialog/dialog.dart';
import 'package:voyago/core/widgets/dialog/dilaog_wait.dart';

void showWatingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const PleaseWaitDialog();
    },
  );
}

void showSuccessDialog(BuildContext context, {String subtitle='sssssssssssssssss'}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return  DialogCustom(
        title: 'Success!',
        imagePath: Wallet.successDialog,
        subtitel: subtitle,
      );
    },
  );
}

void showFailureDialog(BuildContext context, {String sutitle = 'ffffffffffffff'}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return  DialogCustom(
        title: 'Failure!',
        imagePath: Wallet.failureDialog,
        subtitel: sutitle,
      );
    },
  );
}
