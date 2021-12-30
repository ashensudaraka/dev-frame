import 'package:dev_frame/generated/l10n.dart';
import 'package:dev_frame/utils/validations.dart';
import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final TextEditingController controller;
  final bool useMobileLayout;
  final bool obscureText;
  final String inputType; //Input Types = {none, email, password}
  final bool isRequired;
  final function;
  final fillColor;
  final bool filled;
  final String labelText;
  final Widget suffixIcon;

  const TextField(
      {@required this.controller,
      @required this.useMobileLayout,
      this.obscureText,
      @required this.inputType,
      @required this.isRequired,
      this.function,
      this.fillColor,
      this.filled,
      this.labelText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
              useMobileLayout == true ? 10.0 : 12.0,
              useMobileLayout == true ? 18.0 : 20.0,
              useMobileLayout == true ? 10.0 : 12.0,
              useMobileLayout == true ? 18.0 : 20.0),
          border: OutlineInputBorder(),
          suffixIcon: suffixIcon,
          fillColor: fillColor,
          filled: filled,
          labelText: labelText),

      // ignore: missing_return
      validator: (v) {
        //Required
        if (isRequired == true) {
          if (inputType == 'none') {
            if (v.isEmpty) {
              return DevFrameLocalization.of(context).requiredValidation;
            } else {
              return null;
            }
          } else if (inputType == 'email') {
            if (v.isEmpty) {
              return DevFrameLocalization.of(context).requiredValidation;
            } else if (!v.isValidEmail) {
              return DevFrameLocalization.of(context).invalidValidation;
            } else {
              return null;
            }
          } else if (inputType == 'password') {
            if (v.isEmpty) {
              return DevFrameLocalization.of(context).requiredValidation;
            } else if (!v.isValidPassword) {
              return DevFrameLocalization.of(context).invalidValidation;
            } else {
              return null;
            }
          }
        }
        //Not required
        else {
          if (inputType == 'none') {
            return null;
          } else if (inputType == 'email') {
            if (v.isValidEmail) {
              return DevFrameLocalization.of(context).invalidValidation;
            } else {
              return null;
            }
          } else if (inputType == 'password') {
            if (v.isValidPassword) {
              return DevFrameLocalization.of(context).invalidValidation;
            } else {
              return null;
            }
          }
        }
      },
    );
  }
}

Widget getPasswordSuffixIcon(function, obscureText) {
  return GestureDetector(
    onTap: function,
    child: obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
  );
}
