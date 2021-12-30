import 'package:dev_frame/utils/constants.dart';
import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String text;
  final bool useMobileLayout;
 
  const FormLabel({@required this.text, @required this.useMobileLayout});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: useMobileLayout == true ? 140.0 : 250.0,
      child: Text(
        text,
        style: TextStyle(
          fontSize: useMobileLayout == true ? 16.0 : 20.0,
          color: CustomColors.textColor
        ),
      ),
    );
  }
}