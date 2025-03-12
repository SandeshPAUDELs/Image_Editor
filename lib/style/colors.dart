import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// App Theme Colors
  static Color primaryColor = const Color(0XFFFFC107);
  static Color surfaceColor = const Color(0XFFFFDB6B);
  static Color surfaceColor2 = const Color(0XFFFFECB3);
  static Color containerColor = const Color(0XFFFFFFFF);
  static Color onSurfaceColor = const Color(0XFF212121);
  static Color onSurfaceContainerColor = const Color(0XFF212121);

  /// App Border and Buttons Colors
  static Color textFieldBorderColor = const Color(0XFFFFA000);
  static Color buttonColor = const Color(0XFF009688);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  /// SnackBar Colors
  static Color errorColor = Colors.red.shade800;
  static Color successColor = Colors.green.shade800;

  /// Error and Validation Color
  static Color error = const Color(0XFFE50000);
  static Color warning = const Color(0xFFF57C00);

  //Natural Shade
  static const Color black = Color(0xFF000000);
  static const Color darkerGrey = Color(0xFF4f4f4f);
  static const Color darkgrey = Color(0xFF939393);
  static const Color grey = Color(0xFFe0e0e0);
  static const Color softGrey = Color(0xFFf4f4f4);
  static const Color lightGrey = Color(0xFFf9f9f9);
  static const Color white = Color(0xFFffffff);
  static const Color transparent = Colors.transparent;
}