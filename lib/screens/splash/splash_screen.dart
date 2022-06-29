import 'package:flutter/material.dart';
import 'package:test_app/common/animations.dart';
import 'package:test_app/common/themes.dart';
import 'package:test_app/common/widgets/images.dart';
import 'package:test_app/common/widgets/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String route = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _fadeInOutAnimation();
  }

  @override
  void dispose() {
    _disposeItems();
    super.dispose();
    // لازم الـ disposed items تتحط قبل super.dispose
  }

  void _fadeInOutAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation =
        Tween<double>(begin: 1.0, end: 0.2).animate(_animationController);
    Animations.continuousReversibleAnimation(_animationController, _animation);
  }

  void _disposeItems() {
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    Size _size = _mediaQueryData.size;
    bool _isPortrait = _mediaQueryData.orientation == Orientation.portrait;

    /// to get the current system theme (light mode or dark mode?)
    bool _isLightMode = _mediaQueryData.platformBrightness == Brightness.light;

    /// usage of [Themes] class to change status bar and navigation bar styling
    Themes.setStatNavBarsStyle(_isLightMode);

    return Scaffold(
      body: Stack(children: [
        Center(
          child: FadeTransition(
            opacity: _animation,
            child: _isPortrait
                ? Images.portraitSplashImage(_size)
                : Images.landscapeSplashImage(_size),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: _isPortrait
                ? EdgeInsets.all(_size.height * 0.02)
                : EdgeInsets.all(_size.width * 0.02),
            child: _isPortrait
                ? ProgressIndicators.portraitCircularProgressIndicator(_size)
                : ProgressIndicators.landscapeCircularProgressIndicator(_size),
          ),
        )
      ]),
    );
  }
}
