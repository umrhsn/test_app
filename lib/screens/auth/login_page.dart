import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_app/common/services/form_validation/form_validation.dart';
import 'package:test_app/common/themes.dart';
import 'package:test_app/common/widgets/buttons.dart';
import 'package:test_app/common/widgets/spacings.dart';
import 'package:test_app/common/widgets/text_fields.dart';
import 'package:test_app/common/widgets/titles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static String route = '/register_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextForms _textFormsController = Get.put(TextForms());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQueryData = MediaQuery.of(context);
    final bool _isLightMode =
        _mediaQueryData.platformBrightness == Brightness.light;
    final bool _isPortrait =
        _mediaQueryData.orientation == Orientation.portrait;
    final Size _size = _mediaQueryData.size;

    /// validation Provider
    final _formValidationProvider = Provider.of<FormValidation>(context);
    final bool _isEmailValid = _formValidationProvider.isEmailValid;
    final bool _isPasswordValid = _formValidationProvider.isPasswordValid;

    /// getting validation items
    final getEmailItem = _formValidationProvider.email;
    final getPasswordItem = _formValidationProvider.password;

    /// validation methods from Provider
    void validateEmailForm(String? value) =>
        _formValidationProvider.validateEmailForm(value);
    void validatePasswordForm(String? value) =>
        _formValidationProvider.validatePasswordForm(value);

    Themes.setStatNavBarsStyle(_isLightMode);

    return Scaffold(
      // appBar: AppBars.noTitleAppBarSettings(_isLightMode),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Titles.authPagesTitleWithLogo(_isPortrait, _size),
                Spacings.columnBigSpace(_isPortrait, _size),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        _isPortrait ? _size.height * 0.03 : _size.width * 0.03,
                  ),
                  child: Column(
                    children: [
                      /// email text form field
                      TextForms.textForm(
                          context,
                          _isPortrait,
                          _isEmailValid,
                          _size,
                          _emailController,
                          _emailFocusNode,
                          _passwordFocusNode,
                          'Email',
                          'enter your email here',
                          getEmailItem,
                          Icons.email_outlined,
                          TextInputType.emailAddress,
                          TextInputAction.next,
                          (value) => validateEmailForm(value)),

                      /// password text form field
                      TextForms.textForm_password(
                          context,
                          _isPortrait,
                          _isPasswordValid,
                          _isLightMode,
                          _size,
                          _passwordController,
                          _passwordFocusNode,
                          null,
                          _textFormsController,
                          getPasswordItem,
                          TextInputAction.done,
                          (value) => validatePasswordForm(value)),

                      /// Spacing
                      Spacings.columnBigSpace(_isPortrait, _size),

                      /// REGISTER button
                      Buttons.authButton(_isPortrait, _size, _isLightMode,
                          _formValidationProvider, 'log in'.toUpperCase())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
