import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_app/common/services/form_validation/form_validation.dart';
import 'package:test_app/common/themes.dart';
import 'package:test_app/screens/auth/register_page.dart';
import 'package:test_app/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        bool _isWaiting = snapshot.connectionState == ConnectionState.waiting;
        return ChangeNotifierProvider(
          create: (BuildContext context) {
            return FormValidation();
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Test App',
            themeMode: ThemeMode.system,

            /// usage of [Themes.lightThemeData] in main method
            theme: Themes.light(),

            /// usage of [Themes.darkThemeData] in main method
            darkTheme: Themes.dark(),
            home: _isWaiting ? const SplashScreen() : const RegisterPage(),
          ),
        );
      },
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the images screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // await Future.delayed(const Duration(seconds: 5));
  }
}
