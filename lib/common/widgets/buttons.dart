import 'package:flutter/material.dart';
import 'package:test_app/common/services/form_validation/form_validation.dart';
import 'package:test_app/common/themes.dart';

class Buttons {
  /// [authButton] is to be used in auth screens to [REGISTER] or [LOGIN]
  static Padding authButton(bool _isPortrait, Size _size, bool _isLightMode,
      FormValidation _validationService, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _isPortrait ? _size.height * 0.03 : _size.width * 0.03,
      ),
      child: MaterialButton(
        elevation: 5,
        disabledElevation: 0,
        height: _isPortrait ? _size.height * 0.045 : _size.width * 0.045,
        minWidth: _isPortrait ? double.infinity : _size.width * 0.5,
        color:
            _isLightMode ? Themes.primarySwatchLight : Themes.primarySwatchDark,
        disabledColor: Colors.grey,
        onPressed:
            !_validationService.isValid ? null : _validationService.submitData,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: _isPortrait ? _size.height * 0.018 : _size.width * 0.018,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
