// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/common/services/form_validation/validation_item.dart';
import 'package:test_app/common/themes.dart';

class TextForms extends GetxController {
  var isObscure = true.obs;

  static SizedBox textForm(
    BuildContext context,
    bool _isPortrait,
    bool _isValid,
    Size _size,
    TextEditingController textController,
    FocusNode currentFocusNode,
    FocusNode? requestedFocusNode,
    String labelText,
    String hintText,
    ValidationItem getValidationItem,
    IconData prefixIcon,
    TextInputType inputType,
    TextInputAction inputAction,
    void Function(String? value) validateItemForm,
  ) {
    return SizedBox(
        width: _isPortrait ? double.infinity : _size.width * 0.5,
        child: TextField(
          controller: textController,
          focusNode: currentFocusNode,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle:
                _labelStyle(textController, _isValid, getValidationItem),
            hintText: hintText,
            prefixIcon: _prefixIcon(
                textController, prefixIcon, _isValid, getValidationItem),
            errorText: getValidationItem.error,
            errorMaxLines: 5,
          ),
          keyboardType: inputType,
          obscureText: false,
          textInputAction: inputAction,
          textAlign: TextAlign.start,
          onChanged: (String? value) => validateItemForm(value),
          onSubmitted: (_) => requestFocus(context, requestedFocusNode),
        ));
  }

  static SizedBox textForm_password(
      BuildContext context,
      bool _isPortrait,
      bool _isPasswordValid,
      bool _isLightMode,
      Size _size,
      TextEditingController _passwordController,
      FocusNode _passwordFocusNode,
      FocusNode? requestedFocusNode,
      TextForms _textFormsController,
      ValidationItem getPasswordItem,
      TextInputAction inputAction,
      Function(String? value) validatePasswordForm,
      {void Function(String _)? onSubmitted}) {
    return SizedBox(
        width: _isPortrait ? double.infinity : _size.width * 0.5,
        child: Obx(
          () => TextField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: _labelStyle(
                  _passwordController, _isPasswordValid, getPasswordItem),
              hintText: 'enter your password here',
              prefixIcon: _prefixIcon_password(
                  _passwordController, _isPasswordValid, getPasswordItem),
              suffixIcon: _changePasswordVisibility(
                  _textFormsController, _passwordController, _isLightMode),
              errorText: getPasswordItem.error,
              errorMaxLines: 5,
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: _textFormsController.isObscure.value,
            textInputAction: inputAction,
            textAlign: TextAlign.start,
            onChanged: (String? value) => validatePasswordForm(value),
            onSubmitted: onSubmitted,
          ),
        ));
  }

  static TextStyle _labelStyle(TextEditingController textController,
      bool _isValid, ValidationItem getValidationItem) {
    return textController.text.isNotEmpty
        ? TextStyle(color: _isValid ? Themes.validColor : Themes.errorColor)
        : getValidationItem.error == null
            ? const TextStyle()
            : TextStyle(color: Themes.errorColor);
  }

  static Icon _prefixIcon(TextEditingController textController,
      IconData prefixIcon, bool _isValid, ValidationItem getValidationItem) {
    return textController.text.isNotEmpty
        ? Icon(prefixIcon,
            color: _isValid ? Themes.validColor : Themes.errorColor)
        : getValidationItem.error == null
            ? Icon(prefixIcon)
            : Icon(prefixIcon, color: Themes.errorColor);
  }

  static Icon _prefixIcon_password(TextEditingController _passwordController,
      bool _isPasswordValid, ValidationItem getPasswordItem) {
    return _passwordController.text.isNotEmpty
        ? _isPasswordValid
            ? Icon(Icons.lock_outline, color: Themes.validColor)
            : Icon(Icons.lock_open, color: Themes.errorColor)
        : getPasswordItem.error == null
            ? const Icon(Icons.lock_open)
            : Icon(Icons.lock_open, color: Themes.errorColor);
  }

  static Obx _changePasswordVisibility(TextForms _textFormsController,
      TextEditingController _passwordController, bool _isLightMode) {
    return Obx(() => GestureDetector(
          onLongPress: () => _textFormsController.isObscure.value = false,
          onLongPressUp: () => _textFormsController.isObscure.value = true,
          child: Icon(
              _passwordController.text.isNotEmpty
                  ? Icons.visibility_outlined
                  : null,
              color: _textFormsController.isObscure.isTrue
                  ? Colors.grey
                  : _isLightMode
                      ? Themes.primarySwatchLight
                      : Themes.primarySwatchDark),
        ));
  }

  static void requestFocus(
      BuildContext context, FocusNode? requestedFocusNode) {
    FocusScope.of(context).requestFocus(requestedFocusNode);
  }
}
