import 'package:flutter/material.dart';
import 'package:test_app/screens/auth/login_page.dart';
import 'package:test_app/screens/auth/register_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isRegisterPageShown = true;

  @override
  Widget build(BuildContext context) {
    final _mediaQueryData = MediaQuery.of(context);
    final bool _isLightMode =
        _mediaQueryData.platformBrightness == Brightness.light;
    final bool _isPortrait =
        _mediaQueryData.orientation == Orientation.portrait;
    final Size _size = _mediaQueryData.size;

    return Scaffold(
      body: Stack(children: [
        /// register page
        Positioned(
          width: _size.width * 0.88,
          height: _size.height,
          left: _isRegisterPageShown ? _size.width * 0.76 : 0,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: RegisterPage(),
          ),
        ),

        /// login page
        Positioned(
          width: _size.width * 0.88,
          height: _size.height,
          left: _isRegisterPageShown ? _size.width * 0.12 : _size.width * 0.88,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: LoginPage(),
          ),
        )
      ]),
    );
  }
}
