import 'package:dev_frame/blocs/user_details_bloc.dart';
import 'package:dev_frame/models/user_details.dart';
import 'package:dev_frame/view/settings_view.dart';
import 'package:dev_frame/widgets/error_alert.dart';
import 'package:dev_frame/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:dev_frame/blocs/login_bloc.dart';
import 'package:dev_frame/models/login.dart';
import 'package:dev_frame/networking/response.dart';
import 'package:dev_frame/view/tenant_view.dart';
import 'package:dev_frame/utils/constants.dart';
import 'package:dev_frame/widgets/loading.dart';
import 'package:dev_frame/widgets/text_field.dart' as textField;
import 'package:dev_frame/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

LoginBloc _loginBloc;
UserDetailsBloc _userDetailsBloc;
bool _showPassword = true;
var usernameController = TextEditingController();
var passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
    _userDetailsBloc = UserDetailsBloc();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    _userDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: AssetImage('images/loginBack.jpg'),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: settingsButton(context)),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    shape: BoxShape.rectangle,
                    color: isMobileLayout(context)
                        ? Colors.transparent
                        : Colors.white,
                  ),
                  height: isMobileLayout(context) ? 600 : 790,
                  padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: isMobileLayout(context) ? 40.0 : 60.0),
                  constraints: BoxConstraints(
                    maxWidth: 550,
                  ),
                  child: ListView(children: [
                    SizedBox(height: isMobileLayout(context) ? 0.0 : 40.0),
                    logo(isMobileLayout(context), context),
                    SizedBox(height: isMobileLayout(context) ? 100.0 : 110.0),
                    textField.TextField(
                        controller: usernameController,
                        useMobileLayout: isMobileLayout(context),
                        obscureText: false,
                        inputType: 'none',
                        isRequired: true,
                        fillColor: CustomColors.textFieldFillColor,
                        filled: true,
                        labelText:
                            DevFrameLocalization.of(context).userNameLabel),
                    SizedBox(height: isMobileLayout(context) ? 20.0 : 50.0),
                    textField.TextField(
                      controller: passwordController,
                      useMobileLayout: isMobileLayout(context),
                      obscureText: _showPassword,
                      inputType: 'none',
                      isRequired: true,
                      function: _togglePasswordVisibility,
                      fillColor: CustomColors.textFieldFillColor,
                      filled: true,
                      labelText: DevFrameLocalization.of(context).passwordLabel,
                      suffixIcon: getPasswordSuffixIcon(
                          _togglePasswordVisibility, _showPassword),
                    ),
                    SizedBox(height: isMobileLayout(context) ? 40.0 : 50.0),
                    loginButton(isMobileLayout(context), context),
                    SizedBox(height: isMobileLayout(context) ? 20.0 : 30.0),
                    forgotPasswordText(context),
                    loginResponse(),
                    userDetailsResponse()
                  ]),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

Widget logo(useMobileLayout, BuildContext context) {
  return Column(
    children: [
      Container(
        height: useMobileLayout == true ? 60.0 : 100.0,
        child: Image.asset('images/logo.png'),
      ),
      SizedBox(height: useMobileLayout == true ? 30.0 : 60.0),
      Text(
        DevFrameLocalization.of(context).loginPageTitle,
        style: TextStyle(
            fontSize: useMobileLayout == true ? 35.0 : 46.0,
            color: useMobileLayout == true
                ? CustomColors.textColorWhite
                : CustomColors.headingTextColor,
            fontWeight: FontWeight.w400),
      ),
    ],
  );
}

Widget loginButton(useMobileLayout, BuildContext context) {
  getServerIp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String serverIp = (prefs.getString('serverIp'));
    return serverIp;
  }

  return ButtonTheme(
    minWidth: 600.0,
    height: useMobileLayout ? 50.0 : 80.0,
    // ignore: deprecated_member_use
    child: RaisedButton(
        color: CustomColors.buttonColor,
        child: Text(DevFrameLocalization.of(context).loginButton,
            style: TextStyle(
                color: CustomColors.buttonTextColor,
                fontSize: getTextSize(useMobileLayout))),
        onPressed: () async {
          String ip = await getServerIp();
          if (ip == null || ip == "") {
            showErrorAlertDialog(
                context, DevFrameLocalization.of(context).errorEmptyIpAddress);
          } else if (usernameController.text.toString() == "" &&
              passwordController.text.toString() == "") {
            showErrorAlertDialog(context,
                DevFrameLocalization.of(context).errorEmptyUserCredentials);
          } else {
            _loginBloc.getLoginData(usernameController.text.toString(),
                passwordController.text.toString());
          }
        }),
  );
}

Widget forgotPasswordText(context) {
  return TextButton(
    onPressed: () {},
    child: Text(
      DevFrameLocalization.of(context).forgotPasswordButton,
      style: TextStyle(
          color: CustomColors.buttonColor,
          fontWeight: FontWeight.bold,
          fontSize: getTextSize(isMobileLayout(context))),
    ),
  );
}

Widget settingsButton(BuildContext context) {
  return ElevatedButton(
      child: Icon(
        Icons.settings,
        color: Colors.grey.shade700,
      ),
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingsPage(),
            )));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade300,
        minimumSize: Size(30, 40),
      ));
}

Widget loginResponse() {
  return StreamBuilder<Response<Login>>(
    stream: _loginBloc.loginStream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        switch (snapshot.data.status) {
          case Status.LOADING:
            return Loading(loadingMessage: snapshot.data.message);
            break;
          case Status.COMPLETED:
            _userDetailsBloc.getUserDetails();
            break;
          case Status.ERROR:
            //return Text(snapshot.data.message + "......");
            return Column(
              children: [
                SizedBox(height: isMobileLayout(context) ? 20.0 : 30.0),
                Center(
                  child: Text(
                    snapshot.data.message.toString(),
                    style: TextStyle(
                        color: CustomColors.errorTextColor,
                        fontSize: getTextSize(isMobileLayout(context)),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
            break;
        }
      }
      return Container();
    },
  );
}

Widget userDetailsResponse() {
  storeUsername(username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  return StreamBuilder<Response<UserDetails>>(
    stream: _userDetailsBloc.userDetailsStream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        switch (snapshot.data.status) {
          case Status.LOADING:
            return Loading(loadingMessage: snapshot.data.message);
            break;
          case Status.COMPLETED:
            usernameController.clear();
            passwordController.clear();
            storeUsername(snapshot.data.data.firstName.toString());
            WidgetsBinding.instance
                .addPostFrameCallback((_) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ViewTenant()),
                      (Route<dynamic> route) => false,
                    ));
            break;
          case Status.ERROR:
            return Column(
              children: [
                SizedBox(height: isMobileLayout(context) ? 10.0 : 20.0),
                Center(
                  child: Text(
                    snapshot.data.message.toString(),
                    style: TextStyle(
                        color: CustomColors.errorTextColor,
                        fontSize: getTextSize(isMobileLayout(context)),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
            break;
        }
      }
      return Container();
    },
  );
}
