import 'package:flutter/material.dart';
import 'package:whats_up/theme/style.dart';

class AppTheme {
  static TextStyle normalGreenHeadline = const TextStyle(
    color: primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle boldGreenHeadline = const TextStyle(
    color: primaryColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle normalBlackText = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle normalWhiteText = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonText = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  static TextStyle hintText = const TextStyle(
    color: Color(0xffababab),
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bottomNavText = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle cardText = const TextStyle(
    color: Color(0xff3e3e3e),
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle orderText = const TextStyle(
    color: Color(0xffababab),
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}
