// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class DevFrameLocalization {
  DevFrameLocalization();
  
  static DevFrameLocalization current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<DevFrameLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      DevFrameLocalization.current = DevFrameLocalization();
      
      return DevFrameLocalization.current;
    });
  } 

  static DevFrameLocalization of(BuildContext context) {
    return Localizations.of<DevFrameLocalization>(context, DevFrameLocalization);
  }

  /// `Dev Frame`
  String get loginPageTitle {
    return Intl.message(
      'Dev Frame',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get titleSettings {
    return Intl.message(
      'Settings',
      name: 'titleSettings',
      desc: '',
      args: [],
    );
  }

  /// `Tenant`
  String get viewTenantPageTitle {
    return Intl.message(
      'Tenant',
      name: 'viewTenantPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Tenant`
  String get newTenantPageTitle {
    return Intl.message(
      'New Tenant',
      name: 'newTenantPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Tenant`
  String get editTenantPageTitle {
    return Intl.message(
      'Edit Tenant',
      name: 'editTenantPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsPageTitle {
    return Intl.message(
      'Settings',
      name: 'settingsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get testPageTitle {
    return Intl.message(
      'Test',
      name: 'testPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPasswordButton {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get userNameLabel {
    return Intl.message(
      'UserName',
      name: 'userNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get usersText {
    return Intl.message(
      'Users',
      name: 'usersText',
      desc: '',
      args: [],
    );
  }

  /// `Tenant Name`
  String get tenantNameText {
    return Intl.message(
      'Tenant Name',
      name: 'tenantNameText',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get customerNameText {
    return Intl.message(
      'Customer Name',
      name: 'customerNameText',
      desc: '',
      args: [],
    );
  }

  /// `Max Users`
  String get maxUsersText {
    return Intl.message(
      'Max Users',
      name: 'maxUsersText',
      desc: '',
      args: [],
    );
  }

  /// `Valid Until`
  String get validUntilText {
    return Intl.message(
      'Valid Until',
      name: 'validUntilText',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get statusText {
    return Intl.message(
      'Status',
      name: 'statusText',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameText {
    return Intl.message(
      'Name',
      name: 'nameText',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailText {
    return Intl.message(
      'Email',
      name: 'emailText',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userNameText {
    return Intl.message(
      'User Name',
      name: 'userNameText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordText {
    return Intl.message(
      'Password',
      name: 'passwordText',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordText {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Admin Details`
  String get adminDetailsText {
    return Intl.message(
      'Admin Details',
      name: 'adminDetailsText',
      desc: '',
      args: [],
    );
  }

  /// `Server IP`
  String get serverIpText {
    return Intl.message(
      'Server IP',
      name: 'serverIpText',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveTooltip {
    return Intl.message(
      'Save',
      name: 'saveTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get requiredValidation {
    return Intl.message(
      'Required',
      name: 'requiredValidation',
      desc: '',
      args: [],
    );
  }

  /// `Invalid`
  String get invalidValidation {
    return Intl.message(
      'Invalid',
      name: 'invalidValidation',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get successMessageTitle {
    return Intl.message(
      'Success!',
      name: 'successMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Error!`
  String get errorMessageTitle {
    return Intl.message(
      'Error!',
      name: 'errorMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get okText {
    return Intl.message(
      'OK',
      name: 'okText',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Request`
  String get status400Error {
    return Intl.message(
      'Invalid Request',
      name: 'status400Error',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorised`
  String get status403Error {
    return Intl.message(
      'Unauthorised',
      name: 'status403Error',
      desc: '',
      args: [],
    );
  }

  /// `Error During Communication`
  String get status502Error {
    return Intl.message(
      'Error During Communication',
      name: 'status502Error',
      desc: '',
      args: [],
    );
  }

  /// `Error with StatusCode : `
  String get status502ErrorDesc {
    return Intl.message(
      'Error with StatusCode : ',
      name: 'status502ErrorDesc',
      desc: '',
      args: [],
    );
  }

  /// `Undefined Error`
  String get status500Error {
    return Intl.message(
      'Undefined Error',
      name: 'status500Error',
      desc: '',
      args: [],
    );
  }

  /// `No Internet connection`
  String get networkError {
    return Intl.message(
      'No Internet connection',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Username or Password`
  String get invalidUserCredentialsError {
    return Intl.message(
      'Invalid Username or Password',
      name: 'invalidUserCredentialsError',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password does not match.`
  String get matchPasswordError {
    return Intl.message(
      'Password and confirm password does not match.',
      name: 'matchPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `One or more fields have an error. Please check and try again.`
  String get validationError {
    return Intl.message(
      'One or more fields have an error. Please check and try again.',
      name: 'validationError',
      desc: '',
      args: [],
    );
  }

  /// `New tenant record has been added successfully.`
  String get tenantAddSuccess {
    return Intl.message(
      'New tenant record has been added successfully.',
      name: 'tenantAddSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Tenant record has been updated successfully.`
  String get tenantUpdateSuccess {
    return Intl.message(
      'Tenant record has been updated successfully.',
      name: 'tenantUpdateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get buttonTextOk {
    return Intl.message(
      'Ok',
      name: 'buttonTextOk',
      desc: '',
      args: [],
    );
  }

  /// `Server IP address has been saved.`
  String get successTextIpSaved {
    return Intl.message(
      'Server IP address has been saved.',
      name: 'successTextIpSaved',
      desc: '',
      args: [],
    );
  }

  /// `Please add server ip address before login.`
  String get errorEmptyIpAddress {
    return Intl.message(
      'Please add server ip address before login.',
      name: 'errorEmptyIpAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter username and password.`
  String get errorEmptyUserCredentials {
    return Intl.message(
      'Enter username and password.',
      name: 'errorEmptyUserCredentials',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<DevFrameLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<DevFrameLocalization> load(Locale locale) => DevFrameLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}