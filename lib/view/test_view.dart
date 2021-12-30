import 'package:dev_frame/blocs/logout_bloc.dart';
import 'package:dev_frame/generated/l10n.dart';
import 'package:dev_frame/utils/constants.dart';
import 'package:dev_frame/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  LogoutBloc _drawerBloc;

  @override
  void initState() {
    super.initState();
    _drawerBloc = LogoutBloc();
  }

  @override
  void dispose() {
    _drawerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: CustomColors.appBarColor,
          title: Text(DevFrameLocalization.of(context).testPageTitle,
              style: TextStyle(
                  fontSize: getAppBarTextSize(isMobileLayout(context)))),
        ),
        backgroundColor: CustomColors.backgroundColor,
        body: Center(
          child: Text('Test'),
        ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {
            
        //     },
        //     tooltip: DevFrameLocalization.of(context).viewTenantPageTitle,
        //     child: Icon(Icons.add),
        //     backgroundColor: CustomColors.buttonColor,
        //   )
        );
  }
}
