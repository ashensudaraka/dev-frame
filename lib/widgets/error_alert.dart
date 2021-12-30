import 'package:dev_frame/generated/l10n.dart';
import 'package:flutter/material.dart';

showErrorAlertDialog(BuildContext context, errorMessage) {
  Widget okButton = TextButton(
      child: Text(DevFrameLocalization.of(context).okText),
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pop(false);
        });
      });
  AlertDialog alert = AlertDialog(
    title: Text(DevFrameLocalization.of(context).errorMessageTitle),
    content: Text(errorMessage),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}