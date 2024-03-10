import 'package:flutter/material.dart';
import 'package:plantshop/backend/colors.dart';

class CustomSnackBar {
  static void successSnackbar({
    required BuildContext context,
    String  message = '',
  }) {
    final s = SnackBar(
      content: Text(message),
      backgroundColor: greenColor,
    );

    showSnackbar(s, context);
  }

  static void failureSnackbar({
    required BuildContext context,
    String message = '',
  }) {
    final s = SnackBar(
      content: Text(message),
      backgroundColor: Colors.redAccent,
    );
    showSnackbar(s, context);
  }

  static void showSnackbar(SnackBar snackBar, BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
