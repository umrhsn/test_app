import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_app/common/services/form_validation/form_validation.dart';
import 'package:test_app/common/themes.dart';
import 'package:test_app/common/widgets/buttons.dart';
import 'package:test_app/common/widgets/spacings.dart';
import 'package:test_app/common/widgets/text_fields.dart';
import 'package:test_app/common/widgets/titles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static String route = '/register_screen';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextForms _textFormsController = Get.put(TextForms());
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _dateOfBirthFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(() => setState(() {}));
    _lastNameController.addListener(() => setState(() {}));
    _usernameController.addListener(() => setState(() {}));
    _dateOfBirthController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _dateOfBirthController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _usernameFocusNode.dispose();
    _dateOfBirthFocusNode.dispose();
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
    final bool _isFirstNameValid = _formValidationProvider.isFirstNameValid;
    final bool _isLastNameValid = _formValidationProvider.isLastNameValid;
    final bool _isUsernameValid = _formValidationProvider.isUsernameValid;
    final bool _isDateOfBirthValid = _formValidationProvider.isDateOfBirthValid;
    final bool _isEmailValid = _formValidationProvider.isEmailValid;
    final bool _isPasswordValid = _formValidationProvider.isPasswordValid;

    /// getting validation items
    final getFirstNameItem = _formValidationProvider.firstName;
    final getLastNameItem = _formValidationProvider.lastName;
    final getUsernameItem = _formValidationProvider.username;
    final getDateOfBirthItem = _formValidationProvider.dateOfBirth;
    final getEmailItem = _formValidationProvider.email;
    final getPasswordItem = _formValidationProvider.password;

    /// validation methods from Provider
    void validateFirstNameForm(String? value) =>
        _formValidationProvider.validateFirstNameForm(value);
    void validateLastNameForm(String? value) =>
        _formValidationProvider.validateLastNameForm(value);
    void validateUsernameForm(String? value) =>
        _formValidationProvider.validateUsernameForm(value);
    void validateDateOfBirthForm(String? value) =>
        _formValidationProvider.validateDateOfBirthForm(value);
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
                      /// first name text form field
                      TextForms.textForm(
                          context,
                          _isPortrait,
                          _isFirstNameValid,
                          _size,
                          _firstNameController,
                          _firstNameFocusNode,
                          _lastNameFocusNode,
                          'First Name',
                          'enter your first name here',
                          getFirstNameItem,
                          Icons.person_outlined,
                          TextInputType.name,
                          TextInputAction.next,
                          (value) => validateFirstNameForm(value)),

                      /// last name text form field
                      TextForms.textForm(
                          context,
                          _isPortrait,
                          _isLastNameValid,
                          _size,
                          _lastNameController,
                          _lastNameFocusNode,
                          _usernameFocusNode,
                          'Last Name',
                          'enter your last name here',
                          getLastNameItem,
                          Icons.person_outlined,
                          TextInputType.name,
                          TextInputAction.next,
                          (value) => validateLastNameForm(value)),

                      /// username text form field
                      TextForms.textForm(
                          context,
                          _isPortrait,
                          _isUsernameValid,
                          _size,
                          _usernameController,
                          _usernameFocusNode,
                          _dateOfBirthFocusNode,
                          'Username',
                          'enter your username here',
                          getUsernameItem,
                          Icons.account_box_outlined,
                          TextInputType.name,
                          TextInputAction.next,
                          (value) =>
                              // TODO: check if username is used by another user
                              // now I'm using a test method
                              validateUsernameForm(value)),

                      /// date of birth text form field
                      TextForms.textForm(
                          context,
                          _isPortrait,
                          _isDateOfBirthValid,
                          _size,
                          _dateOfBirthController,
                          _dateOfBirthFocusNode,
                          _emailFocusNode,
                          'Birth Date',
                          'yyyy-mm-dd',
                          getDateOfBirthItem,
                          Icons.cake_outlined,
                          TextInputType.datetime,
                          TextInputAction.next,
                          (value) => validateDateOfBirthForm(value)),

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
                          _formValidationProvider, 'register'.toUpperCase())
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
