import 'package:dev_frame/generated/l10n.dart';
import 'package:dev_frame/utils/constants.dart';
import 'package:dev_frame/widgets/form_label.dart';
import 'package:dev_frame/widgets/success_alert.dart';
import 'package:flutter/material.dart';
import 'package:dev_frame/widgets/text_field.dart' as textField;
import 'package:shared_preferences/shared_preferences.dart';

var serverIpController = TextEditingController();

class SettingsPage extends StatefulWidget {
  const SettingsPage({key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  getServerIp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String serverIp = (prefs.getString('serverIp'));
    serverIpController.text = serverIp;
  }

  @override
  initState() {
    super.initState();
    getServerIp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.appBarColor,
        title: Text(DevFrameLocalization.of(context).titleSettings,
            style: TextStyle(
                fontSize: getAppBarTextSize(isMobileLayout(context)))),
      ),
      backgroundColor: CustomColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          //color: CustomColors.formBackgroundColor,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: ListTile(
            leading: FormLabel(
                text: 'Server IP', useMobileLayout: isMobileLayout(context)),
            title: textField.TextField(
                useMobileLayout: isMobileLayout(context),
                isRequired: false,
                controller: serverIpController,
                inputType: 'none',
                obscureText: false),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: getFloatingButtonSize(isMobileLayout(context)),
        width: getFloatingButtonSize(isMobileLayout(context)),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {
              print("SAVE BUTTON PRESSED");
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString(
                  'serverIp', serverIpController.text.toString());
              showSuccessAlertDialog(
                  context, DevFrameLocalization.of(context).successTextIpSaved);
            },
            tooltip: DevFrameLocalization.of(context).saveTooltip,
            child: Icon(Icons.save, size: getFloatingButtonIconSize(isMobileLayout(context))),
            backgroundColor: CustomColors.buttonColor,
          ),
        ),
      ),
    );
  }
}
