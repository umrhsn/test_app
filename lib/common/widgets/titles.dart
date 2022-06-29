import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/widgets/images.dart';

class Titles {
  static Row authPagesTitleWithLogo(bool isPortrait, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
            child: SizedBox(
          height: isPortrait ? size.height * 0.08 : size.width * 0.08,
          width: isPortrait ? size.height * 0.08 : size.width * 0.08,
          child: Images.logoAssetImage,
        )),
        Flexible(
            child: SizedBox(
          width: isPortrait ? size.height * 0.02 : size.width * 0.02,
        )),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'TEST',
                    textStyle: TextStyle(
                      fontSize:
                          isPortrait ? size.height * 0.03 : size.width * 0.03,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 80),
                  )
                ],
                isRepeatingAnimation: false,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'APP',
                    textStyle: TextStyle(
                      fontSize:
                          isPortrait ? size.height * 0.04 : size.width * 0.04,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 500),
                  )
                ],
                isRepeatingAnimation: false,
              )
            ],
          ),
        )
      ],
    );
  }
}
