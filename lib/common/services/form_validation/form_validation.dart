import 'package:flutter/foundation.dart';
import 'package:test_app/common/services/form_validation/validation_item.dart';

class FormValidation with ChangeNotifier {
  ValidationItem _firstName = ValidationItem(null, null);
  ValidationItem _lastName = ValidationItem(null, null);
  ValidationItem _username = ValidationItem(null, null);
  ValidationItem _dateOfBirth = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  ValidationItem get firstName => _firstName;

  ValidationItem get lastName => _lastName;

  ValidationItem get username => _username;

  ValidationItem get dateOfBirth => _dateOfBirth;

  ValidationItem get email => _email;

  ValidationItem get password => _password;

  /// each [bool] of the below checks if [ValidationItem] form is valid
  // first name form check
  bool get isFirstNameValid {
    if (_firstName.value != null) {
      return true;
    } else {
      return false;
    }
  }

  // last name form check
  bool get isLastNameValid {
    if (_lastName.value != null) {
      return true;
    } else {
      return false;
    }
  }

  // username form check
  bool get isUsernameValid {
    if (_username.value != null) {
      return true;
    } else {
      return false;
    }
  }

  // date of birth form check
  bool get isDateOfBirthValid {
    if (_dateOfBirth.value != null) {
      return true;
    } else {
      return false;
    }
  }

  // email form check
  bool get isEmailValid {
    if (_email.value != null) {
      return true;
    } else {
      return false;
    }
  }

  // password form check
  bool get isPasswordValid {
    if (_password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  /// [isValid] is used to make the [REGISTER] button [enabled] or [disabled]
  /// in this method; best approach I've encountered so far is to check the booleans [isFirstNameValid] to [isPasswordValid] with excluding [isDateOfBirthValid] and replacing it with (if [_dateOfBirth.error] == null), as [_dateOfBirth] is not a required field
  /// relating to [_dateOfBirth.value] : this will allow the button to be [enabled] if [_dateOfBirth.value] is empty or valid, but if it was invalid; i.e. [_dateOfBirth.error] is not empty, only then it will be [disabled]
  /// without this approach, I found that the button is [disabled] by default until I change the [_dateOfBirth.value]
  bool get isValid {
    if (isFirstNameValid &&
        isLastNameValid &&
        isUsernameValid &&
        _dateOfBirth.error == null // don't use [isDateOfBirthValid] here
        &&
        isEmailValid &&
        isPasswordValid) {
      return true;
    } else {
      return false;
    }
  }

  // TODO: in names, check if all characters are of the same language
  // validate first name form
  void validateFirstNameForm(String? value) {
    const String oneSpCharRegExp =
        r"(?=.*?[~!@#$%^&*_+\-=×÷|\\/:',.<>\(\)\{\}\[\]])";

    final bool matchesLength = value!.length >= 3;
    final bool containsSpaces = value.contains(' ');
    final bool containsSpChar = RegExp(oneSpCharRegExp).hasMatch(value);
    final bool containsNums = value.contains('0') ||
        value.contains('1') ||
        value.contains('2') ||
        value.contains('3') ||
        value.contains('4') ||
        value.contains('5') ||
        value.contains('6') ||
        value.contains('7') ||
        value.contains('8') ||
        value.contains('9');

    const String _requiredFieldMsg = '*required field';
    const String matchesLengthMsg = '*name should be 3 characters at least';
    const String noSpacesMsg = '*name shouldn\'t contain spaces';
    const String noNumbersMsg = '*name shouldn\'t contain numbers';
    const String noSpCharMsg =
        '*name shouldn\'t contain any special characters';

    if (value.isEmpty) {
      _firstName = ValidationItem(null, _requiredFieldMsg);
    } else if (containsSpaces) {
      _firstName = ValidationItem(null, noSpacesMsg);
    } else if (containsNums) {
      _firstName = ValidationItem(null, noNumbersMsg);
    } else if (containsSpChar) {
      _firstName = ValidationItem(null, noSpCharMsg);
    } else if (!matchesLength) {
      _firstName = ValidationItem(null, matchesLengthMsg);
    } else {
      _firstName = ValidationItem(value, null);
    }

    notifyListeners();
  }

  // validate last name form
  void validateLastNameForm(String? value) {
    const String oneSpCharRegExp =
        r"(?=.*?[~!@#$%^&*_+\-=×÷|\\/:',.<>\(\)\{\}\[\]])";

    final bool matchesLength = value!.length >= 3;
    final bool containsSpaces = value.contains(' ');
    final bool containsSpChar = RegExp(oneSpCharRegExp).hasMatch(value);
    final bool containsNums = value.contains('0') ||
        value.contains('1') ||
        value.contains('2') ||
        value.contains('3') ||
        value.contains('4') ||
        value.contains('5') ||
        value.contains('6') ||
        value.contains('7') ||
        value.contains('8') ||
        value.contains('9');

    const String _requiredFieldMsg = '*required field';
    const String matchesLengthMsg = '*name should be 3 characters at least';
    const String noSpacesMsg = '*name shouldn\'t contain spaces';
    const String noNumbersMsg = '*name shouldn\'t contain numbers';
    const String noSpCharMsg =
        '*name shouldn\'t contain any special characters';

    if (value.isEmpty) {
      _lastName = ValidationItem(null, _requiredFieldMsg);
    } else if (containsSpaces) {
      _lastName = ValidationItem(null, noSpacesMsg);
    } else if (containsNums) {
      _lastName = ValidationItem(null, noNumbersMsg);
    } else if (containsSpChar) {
      _lastName = ValidationItem(null, noSpCharMsg);
    } else if (!matchesLength) {
      _lastName = ValidationItem(null, matchesLengthMsg);
    } else {
      _lastName = ValidationItem(value, null);
    }

    notifyListeners();
  }

  // TODO: validateUsername checks if username exists in firebase
  // now I'm just using fake validation using a list of names that user can't use.
  // validate username form
  void validateUsernameForm(String? value) {
    const List<String> usedUsernames = [
      'user',
      'username',
      'umar.hasan',
      'mohamed.ashraf',
      'ali.mohsen',
      'mohamed.elshamy',
      'hussein.elsayed'
    ];

    final bool containsSpaces = value!.contains(' ');
    final bool matchesLength = value.length >= 3;
    final bool invalidFormat = value == usedUsernames.elementAt(0) ||
        value == usedUsernames.elementAt(1);
    final bool isUsed = value == usedUsernames.elementAt(2) ||
        value == usedUsernames.elementAt(3) ||
        value == usedUsernames.elementAt(4) ||
        value == usedUsernames.elementAt(5) ||
        value == usedUsernames.elementAt(6);

    const String _requiredFieldMsg = '*required field';
    const String noSpacesMsg = '*username shouldn\'t contain spaces';
    const String matchesLengthMsg = '*username should be at least 3 characters';
    const String invalidFormatMsg =
        '*you can\'t set username to "user" or "username"';
    const String usernameUsedMsg =
        '*username used by another user, use a different one';

    if (value.isEmpty) {
      _username = ValidationItem(null, _requiredFieldMsg);
    } else if (containsSpaces) {
      _username = ValidationItem(null, noSpacesMsg);
    } else if (!matchesLength) {
      _username = ValidationItem(null, matchesLengthMsg);
    } else if (invalidFormat) {
      _username = ValidationItem(null, invalidFormatMsg);
    } else if (isUsed) {
      _username = ValidationItem(null, usernameUsedMsg);
    } else {
      _username = ValidationItem(value, null);
    }

    notifyListeners();
  }

  // TODO: need to
  //  mark years more than 4 digits (it accepts 6 digits) as invalid
  //  allow a certain range of past years (I think until 1850 is more than enough)
  // validate date of birth form
  void validateDateOfBirthForm(String? value) {
    String invalidFormatMsg = '*invalid format';

    try {
      DateTime.parse(value!);
      _dateOfBirth = ValidationItem(value, null);
    } catch (e) {
      _dateOfBirth = ValidationItem(null, invalidFormatMsg);
    } finally {
      if (value!.isEmpty) {
        _dateOfBirth = ValidationItem(value, null);
      }
    }

    notifyListeners();
  }

  // validate email form
  void validateEmailForm(String? value) {
    const String emailRegExp =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

    final bool containsSpaces = value!.contains(' ');
    final bool isEmailValid =
        RegExp(emailRegExp, caseSensitive: false).hasMatch(value);

    const String _requiredFieldMsg = '*required field';
    const String noSpacesMsg = '*email can\'t contain spaces';
    const String emailFormErrorMsg =
        '*invalid format, must contain "@" and can\'t end with "."';

    if (value.isEmpty) {
      _email = ValidationItem(null, _requiredFieldMsg);
    } else if (containsSpaces) {
      _email = ValidationItem(null, noSpacesMsg);
    } else if (!isEmailValid) {
      _email = ValidationItem(null, emailFormErrorMsg);
    } else {
      _email = ValidationItem(value, null);
    }

    notifyListeners();
  }

  // validate password form
  void validatePasswordForm(String? value) {
    const String twoUppercaseRegExp = r"(?=.*?[A-Z].*?[A-Z])";
    const String twoLowercaseRegExp = r"(?=.*?[a-z].*?[a-z])";
    const String twoNumRegExp = r"(?=.*?[0-9].*?[0-9])";
    const String twoSpCharRegExp =
        r"(?=.*?[~!@#$%^&*_+\-=×÷|\\/:',.<>\(\)\{\}\[\]].*?[~!@#$%^&*_+\-=×÷|\\/:',.<>\(\)\{\}\[\]])";

    final bool containsOneUppercase =
        RegExp(twoUppercaseRegExp).hasMatch(value!);
    final bool containsOneLowercase =
        RegExp(twoLowercaseRegExp).hasMatch(value);
    final bool containsOneNum = RegExp(twoNumRegExp).hasMatch(value);
    final bool containsOneSpChar = RegExp(twoSpCharRegExp).hasMatch(value);
    final bool matchesLength = value.length >= 8;

    const String _requiredFieldMsg = '*required field';
    const String twoUppercaseMsg =
        '*password must contain at least 2 uppercase letters';
    const String twoLowercaseMsg =
        '*password must contain at least 2 lowercase letters';
    const String twoNumMsg = '*password must contain at least 2 number digits';
    const String twoSpCharMsg =
        "*password must contain at least 2 special characters\n~ ! @ # \$ % ^ & * _ + - = × ÷ | \\ / : ' , . < > ( ) { } [ ]";
    const String matchesLengthMsg =
        '*password must be at least 8 characters in length';

    if (value.isEmpty) {
      _password = ValidationItem(null, _requiredFieldMsg);
    } else if (!matchesLength) {
      _password = ValidationItem(null, matchesLengthMsg);
    } else if (!containsOneUppercase) {
      _password = ValidationItem(null, twoUppercaseMsg);
    } else if (!containsOneLowercase) {
      _password = ValidationItem(null, twoLowercaseMsg);
    } else if (!containsOneNum) {
      _password = ValidationItem(null, twoNumMsg);
    } else if (!containsOneSpChar) {
      _password = ValidationItem(null, twoSpCharMsg);
    } else {
      _password = ValidationItem(value, null);
    }

    notifyListeners();
  }

  // submit data after validation
  void submitData() {
    if (kDebugMode) {
      print('first name: ${_firstName.value}'
          '\nlast name: ${_lastName.value}'
          '\nusername: ${_username.value}'
          '\ndate of birth: ${_dateOfBirth.value!.isNotEmpty ? _dateOfBirth.value : 'no data'}'
          '\nemail: ${_email.value}'
          '\npassword: ${_password.value}');
    }
  }
}
