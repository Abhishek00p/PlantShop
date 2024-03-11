import 'package:flutter/material.dart';
import 'package:plantshop/backend/colors.dart';

class CustomSnackBar {
  static SnackBar successSnackbar({
    String message = '',
  }) {
    return SnackBar(
      content: Text(message),
      backgroundColor: greenColor,
    );
  }

  static SnackBar failureSnackbar({
    String message = '',
  }) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.redAccent,
    );
  }
}
