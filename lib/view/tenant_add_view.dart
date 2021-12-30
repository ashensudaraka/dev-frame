import 'package:dev_frame/view/tenant_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dev_frame/blocs/tenant_bloc.dart';
import 'package:dev_frame/models/tenant.dart';
import 'package:dev_frame/networking/response.dart';
import 'package:dev_frame/utils/constants.dart';
import 'package:dev_frame/widgets/loading.dart';
import 'package:dev_frame/widgets/form_label.dart';
import 'package:dev_frame/widgets/date_picker.dart';
import 'package:dev_frame/widgets/error_alert.dart';
import 'package:dev_frame/widgets/text_field.dart' as textField;
import 'package:dev_frame/widgets/dropdown_button.dart' as dropDownButton;
import 'package:dev_frame/generated/l10n.dart';

TenantBloc _bloc;
var nameController = TextEditingController();
var customerNameController = TextEditingController();
var noOfTotalUsersController = TextEditingController();
var expiryDateController = TextEditingController();
var statusController = TextEditingController();
var adminNameController = TextEditingController();
var adminEmailController = TextEditingController();
var adminUsernameController = TextEditingController();
var adminPasswordController = TextEditingController();
var adminConfirmPasswordController = TextEditingController();

class NewTenant extends StatefulWidget {
  NewTenant({Key key}) : super(key: key);
  @override
  _NewTenantState createState() => _NewTenantState();
}

class _NewTenantState extends State<NewTenant> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bloc = TenantBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.appBarColor,
        title: Text(
          DevFrameLocalization.of(context).newTenantPageTitle,
          style:
              TextStyle(fontSize: getAppBarTextSize(isMobileLayout(context))),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(getContainerPadding(isMobileLayout(context))),
        child: Container(
          color: CustomColors.formBackgroundColor,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 10.0),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).tenantNameText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: textField.TextField(
                    controller: nameController,
                    useMobileLayout: isMobileLayout(context),
                    obscureText: false,
                    inputType: 'none',
                    isRequired: true,
                  ),
                  contentPadding: getListTilePadding(context),
                ),
                Divider(
                  color: CustomColors.dividerColor,
                ),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).customerNameText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: textField.TextField(
                    controller: customerNameController,
                    useMobileLayout: isMobileLayout(context),
                    obscureText: false,
                    inputType: 'none',
                    isRequired: true,
                  ),
                  contentPadding: getListTilePadding(context),
                ),
                Divider(
                  color: CustomColors.dividerColor,
                ),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).maxUsersText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: textField.TextField(
                    controller: noOfTotalUsersController,
                    useMobileLayout: isMobileLayout(context),
                    obscureText: false,
                    inputType: 'none',
                    isRequired: true,
                  ),
                  contentPadding: getListTilePadding(context),
                ),
                Divider(
                  color: CustomColors.dividerColor,
                ),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).validUntilText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: DatePicker(
                    controller: expiryDateController,
                    isRequired: true,
                  ),
                  contentPadding: getListTilePadding(context),
                ),
                Divider(
                  color: CustomColors.dividerColor,
                ),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).statusText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: dropDownButton.DropDownButton(
                      controller: statusController),
                  contentPadding: getListTilePadding(context),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Text(DevFrameLocalization.of(context).adminDetailsText,
                      style: TextStyle(
                          color: CustomColors.textColor,
                          fontSize:
                              isMobileLayout(context) == true ? 20.0 : 23.0,
                          fontWeight: FontWeight.w600)),
                  color: CustomColors.backgroundColor,
                  padding: EdgeInsets.fromLTRB(
                      isMobileLayout(context) == true ? 10.0 : 35.0,
                      isMobileLayout(context) == true ? 30.0 : 40.0,
                      isMobileLayout(context) == true ? 10.0 : 35.0,
                      isMobileLayout(context) == true ? 30.0 : 40.0),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).nameText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: textField.TextField(
                    controller: adminNameController,
                    useMobileLayout: isMobileLayout(context),
                    obscureText: false,
                    inputType: 'none',
                    isRequired: true,
                  ),
                  contentPadding: getListTilePadding(context),
                ),
                Divider(
                  color: CustomColors.dividerColor,
                ),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).emailText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: textField.TextField(
                    controller: adminEmailController,
                    useMobileLayout: isMobileLayout(context),
                    obscureText: false,
                    inputType: 'email',
                    isRequired: true,
                  ),
                  contentPadding: getListTilePadding(context),
                ),
                Divider(
                  color: CustomColors.dividerColor,
                ),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).userNameText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: textField.TextField(
                    controller: adminUsernameController,
                    useMobileLayout: isMobileLayout(context),
                    obscureText: false,
                    inputType: 'none',
                    isRequired: true,
                  ),
                  contentPadding: getListTilePadding(context),
                ),
                Divider(
                  color: CustomColors.dividerColor,
                ),
                ListTile(
                  leading: FormLabel(
                    text: DevFrameLocalization.of(context).passwordText,
                    useMobileLayout: isMobileLayout(context),
                  ),
                  title: textField.TextField(
                    controller: adminPasswordController,
                    useMobileLayout: isMobileLayout(context),
                    obscureText: true,
                    inputType: 'password',
                    isRequired: true,
                  ),
                  contentPadding: getListTilePadding(context),
                ),
                Divider(
                  color: CustomColors.dividerColor,
                ),
                ListTile(
                    leading: FormLabel(
                      text:
                          DevFrameLocalization.of(context).confirmPasswordText,
                      useMobileLayout: isMobileLayout(context),
                    ),
                    title: textField.TextField(
                      controller: adminConfirmPasswordController,
                      useMobileLayout: isMobileLayout(context),
                      obscureText: true,
                      inputType: 'password',
                      isRequired: true,
                    ),
                    contentPadding: getListTilePadding(context)),
                SizedBox(height: 10.0),
                apiResponse(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: getFloatingButtonSize(isMobileLayout(context)),
        width: getFloatingButtonSize(isMobileLayout(context)),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {
              print('SAVE BUTTON PRESSED');

              //Checking whether valid inputs
              if (_formKey.currentState.validate()) {
                //Checking whether match passwords
                if (adminPasswordController.text.toString() !=
                    adminConfirmPasswordController.text.toString()) {
                  return showErrorAlertDialog(context,
                      DevFrameLocalization.of(context).matchPasswordError);
                } else {
                  _bloc.addTenantDetail(
                      nameController.text.toString(),
                      customerNameController.text.toString(),
                      adminNameController.text.toString(),
                      adminEmailController.text.toString(),
                      adminUsernameController.text.toString(),
                      adminPasswordController.text.toString(),
                      statusController.text.toString(),
                      expiryDateController.text.toString());
                }
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) =>
                    showErrorAlertDialog(context,
                        DevFrameLocalization.of(context).validationError));
              }
            },
            tooltip: DevFrameLocalization.of(context).saveTooltip,
            child: Icon(Icons.save, size: getFloatingButtonIconSize(isMobileLayout(context))),
            backgroundColor: CustomColors.buttonColor,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

Widget apiResponse() {
  return Container(
    child: StreamBuilder<Response<Tenant>>(
      stream: _bloc.tenantStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return Loading(loadingMessage: snapshot.data.message);
              break;
            case Status.COMPLETED:
              print('NEW TENANT HAS BEEN ADDED');
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => showSuccessAlertDialog(context));
              break;
            case Status.ERROR:
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  showErrorAlertDialog(
                      context, snapshot.data.message.toString()));
              break;
          }
        }
        return Container();
      },
    ),
  );
}

showSuccessAlertDialog(BuildContext context) async {
  Widget okButton = TextButton(
      child: Text(DevFrameLocalization.of(context).okText),
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ViewTenant()),
              (Route<dynamic> route) => false);
        });
      });
  AlertDialog alert = AlertDialog(
    title: Text(DevFrameLocalization.of(context).successMessageTitle),
    content: Text(DevFrameLocalization.of(context).tenantAddSuccess),
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
