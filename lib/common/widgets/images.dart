import 'package:flutter/material.dart';

class Images {
  static const String logoAssetImagePath = 'assets/logo/chat.png';
  static Image logoAssetImage = Image.asset(Images.logoAssetImagePath);

  static Image portraitSplashImage(Size size) {
    return Image.asset(
      Images.logoAssetImagePath,
      height: size.height * 0.15,
      width: size.height * 0.15,
    );
  }

  static Image landscapeSplashImage(Size size) {
    return Image.asset(
      Images.logoAssetImagePath,
      height: size.width * 0.15,
      width: size.width * 0.15,
    );
  }
}
