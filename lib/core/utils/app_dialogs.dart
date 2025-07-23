import 'package:flutter/material.dart';

abstract class AppDialogs {
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? Colors.black87,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static Future<void> displayDialog({
    required Widget title,
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: title);
      },
    );
  }

  static void hideDialog(context) {
    Navigator.of(context).pop();
  }
}
