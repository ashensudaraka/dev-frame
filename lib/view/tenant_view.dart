import 'package:dev_frame/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:dev_frame/blocs/tenant_bloc.dart';
import 'package:dev_frame/models/tenant.dart';
import 'package:dev_frame/networking/response.dart';
import 'package:dev_frame/view/tenant_edit_view.dart';
import 'package:dev_frame/view/tenant_add_view.dart';
import 'package:dev_frame/utils/constants.dart';
import 'package:dev_frame/widgets/loading.dart';
import 'package:dev_frame/widgets/error.dart';
import 'package:dev_frame/generated/l10n.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ViewTenant extends StatefulWidget {
  @override
  _ViewTenantState createState() => _ViewTenantState();
}

class _ViewTenantState extends State<ViewTenant> {
  TenantBloc _tenantBloc;

  @override
  void initState() {
    super.initState();
    _tenantBloc = TenantBloc();
    _tenantBloc.getTenantDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.appBarColor,
        title: Text(DevFrameLocalization.of(context).viewTenantPageTitle,
            style: TextStyle(
                fontSize: getAppBarTextSize(isMobileLayout(context)))),
      ),
      backgroundColor: CustomColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(getContainerPadding(isMobileLayout(context))),
        child: Container(
          color: CustomColors.formBackgroundColor,
          child: RefreshIndicator(
            onRefresh: () => _tenantBloc.getTenantDetails(),
            child: StreamBuilder<ResponseList<Tenant>>(
              stream: _tenantBloc.tenantListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.LOADING:
                      return Loading(loadingMessage: snapshot.data.message);
                      break;
                    case Status.COMPLETED:
                      return TenantList(tenantData: snapshot.data.data);
                      break;
                    case Status.ERROR:
                      return Error(
                        errorMessage: snapshot.data.message,
                        onRetryPressed: () => _tenantBloc.getTenantDetails(),
                      );
                      break;
                  }
                }
                return Container();
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: getFloatingButtonSize(isMobileLayout(context)),
        width: getFloatingButtonSize(isMobileLayout(context)),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewTenant()),
                      ));
            },
            tooltip: DevFrameLocalization.of(context).viewTenantPageTitle,
            child: Icon(Icons.add, size: getFloatingButtonIconSize(isMobileLayout(context))),
            backgroundColor: CustomColors.buttonColor,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tenantBloc.dispose();
    super.dispose();
  }
}

class TenantList extends StatelessWidget {
  final List<Tenant> tenantData;

  TenantList({Key key, this.tenantData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.formBackgroundColor,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: isMobileLayout(context) == true ? 0.25 : 0.15,
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(
                  isMobileLayout(context) == true ? 15.0 : 15.0,
                  isMobileLayout(context) == true ? 0.0 : 10.0,
                  isMobileLayout(context) == true ? 15.0 : 15.0,
                  isMobileLayout(context) == true ? 0.0 : 10.0),
              title: Text(
                tenantData[index].name,
                style: TextStyle(
                    color: CustomColors.textColor,
                    fontSize: getTextSizeLarge(isMobileLayout(context))),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  tenantData[index].noOfConnectedUsers.toString() +
                      " / " +
                      tenantData[index].noOfConnectedUsers.toString() +
                      " " +
                      DevFrameLocalization.of(context).usersText,
                  style: TextStyle(
                    color: CustomColors.textColorBlue,
                    fontSize: getTextSizeExtraLarge(isMobileLayout(context)),
                    //fontWeight: FontWeight.w400
                  ),
                ),
              ),
              trailing: Wrap(
                spacing: 12.0,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text(
                      tenantData[index].status.toString(),
                      style: TextStyle(
                          color: tenantData[index].status.toString() ==
                                  'Connected'
                              ? CustomColors.textColorGreen
                              : tenantData[index].status.toString() == 'On Hold'
                                  ? Colors.orange
                                  : CustomColors.textColorGrey,
                          fontSize: getTextSizeSmall(isMobileLayout(context))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    tenantData[index].expiryDate == null
                        ? Text('null')
                        : Text(
                            getDateFormat(tenantData[index].expiryDate),
                            style: TextStyle(
                                color: CustomColors.textColor,
                                fontSize:
                                    getTextSizeSmall(isMobileLayout(context))),
                          )
                  ]),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) =>
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditTenant(
                                id: tenantData[index].id.toString(),
                                tenantName: tenantData[index].name.toString(),
                                customerName:
                                    tenantData[index].customerName.toString(),
                                noOfTotalUsers:
                                    tenantData[index].noOfTotalUsers.toString(),
                                name: tenantData[index].adminName.toString(),
                                email: tenantData[index].adminEmail.toString(),
                                userName:
                                    tenantData[index].adminUsername.toString(),
                                password:
                                    tenantData[index].adminPassword.toString(),
                                status: tenantData[index].status.toString(),
                                validUntil: getDateFormat(
                                    tenantData[index].expiryDate)))));
              },
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  print('DELETE BUTTON PRESSED');
                },
              ),
            ],
          );
        },
        itemCount: tenantData.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: CustomColors.dividerColor);
        },
      ),
    );
  }
}
