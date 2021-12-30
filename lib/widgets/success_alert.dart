import 'package:dev_frame/generated/l10n.dart';
import 'package:flutter/material.dart';

showSuccessAlertDialog(BuildContext context, successMessage) {
  Widget okButton = TextButton(
      child: Text(DevFrameLocalization.of(context).buttonTextOk),
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pop(false);
        });
      });
  AlertDialog alert = AlertDialog(
    title: Text(DevFrameLocalization.of(context).successMessageTitle),
    content: Text(successMessage),
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
