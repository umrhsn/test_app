import 'package:flutter/material.dart';

class Spacings {
  static SizedBox columnBigSpace(bool isPortrait, Size size) {
    return SizedBox(
        height: isPortrait ? size.height * 0.02 : size.width * 0.02);
  }

  static SizedBox columnSmallSpace(bool isPortrait, Size size) {
    return SizedBox(
        height: isPortrait ? size.height * 0.01 : size.width * 0.01);
  }

  static SizedBox rowBigSpace(bool isPortrait, Size size) {
    return SizedBox(width: isPortrait ? size.height * 0.02 : size.width * 0.02);
  }

  static SizedBox rowSmallSpace(bool isPortrait, Size size) {
    return SizedBox(width: isPortrait ? size.height * 0.01 : size.width * 0.01);
  }
}
