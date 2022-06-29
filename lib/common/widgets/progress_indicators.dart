import 'package:flutter/material.dart';

class ProgressIndicators {
  static SizedBox portraitCircularProgressIndicator(Size size) {
    return SizedBox(
      height: size.height * 0.02,
      width: size.height * 0.02,
      child: CircularProgressIndicator(strokeWidth: size.height * 0.003),
    );
  }

  static SizedBox landscapeCircularProgressIndicator(Size size) {
    return SizedBox(
      height: size.width * 0.02,
      width: size.width * 0.02,
      child: CircularProgressIndicator(strokeWidth: size.height * 0.003),
    );
  }
}
