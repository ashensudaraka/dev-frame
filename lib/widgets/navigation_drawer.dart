import 'package:dev_frame/blocs/logout_bloc.dart';
import 'package:dev_frame/models/logout.dart';
import 'package:dev_frame/networking/response.dart';
import 'package:dev_frame/utils/constants.dart';
import 'package:dev_frame/view/login_view.dart';
import 'package:dev_frame/view/tenant_view.dart';
import 'package:dev_frame/view/test_view.dart';
import 'package:dev_frame/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

LogoutBloc _bloc;
String username = '';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final padding = EdgeInsets.symmetric(horizontal: 10);

  @override
  void initState() {
    super.initState();
    _bloc = LogoutBloc();
    getUsername();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            CustomColors.sideBarbackgroundColor1,
            CustomColors.sideBarbackgroundColor2,
            CustomColors.sideBarbackgroundColor3,
            CustomColors.sideBarbackgroundColor5,
            CustomColors.sideBarbackgroundColor4,
          ])),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: padding,
              children: [
                builderHeader(name: '$username', jobTitle: '$username'),
                Divider(
                  color: Colors.white70,
                ),
                buildMenuItem(
                  context: context,
                  text: 'Tenants',
                  icon: Icons.vpn_key,
                  onClicked: () => selectedItem(context, 1),
                ),
                const SizedBox(height: 10),
                buildMenuItem(
                    context: context,
                    text: 'Test',
                    icon: Icons.accessible,
                    onClicked: () => selectedItem(context, 2)),
                const SizedBox(height: 10),
                logoutResponse(),
              ],
            ),
          ),
          Divider(
            color: Colors.white70,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: buildMenuItem(
                context: context,
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 0)),
          ),
        ],
      ),
    ));
  }

  Widget builderHeader({
    @required String name,
    @required String jobTitle,
  }) {
    return Container(
      padding: padding.add(EdgeInsets.fromLTRB(0, 40, 0, 10)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 20, color: CustomColors.sideBarUserName),
              ),
              const SizedBox(height: 10),
              Text(
                jobTitle,
                style: TextStyle(
                    fontSize: 15, color: CustomColors.sideBarUserJobTitle),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildMenuItem({
    @required BuildContext context,
    @required String text,
    @required IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(
            color: color, fontSize: getTextSizeSmall(isMobileLayout(context))),
      ),
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
 
    switch (index) {
      case 0:
        _bloc.getLogoutData();
        break;
      case 1:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ViewTenant(),
              ));
        });

        break;
      case 2:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TestPage(),
              ));
        });
        break;
    }
  }
}

Widget logoutResponse() {
  return StreamBuilder<Response<Logout>>(
    stream: _bloc.logoutStream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        switch (snapshot.data.status) {
          case Status.LOADING:
            return Loading(loadingMessage: snapshot.data.message);
            break;
          case Status.COMPLETED:
              WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        });
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
