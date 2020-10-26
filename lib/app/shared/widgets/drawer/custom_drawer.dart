import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

import '../../../controllers/home_controller.dart';
import '../../store/page_store.dart';
import 'widgets/drawer_tile.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState 
  extends ModularState<CustomDrawer, HomeController> {

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              // _buildDrawerBack(context),
              UserAccountsDrawerHeader(
                accountName: Text(controller.userModel.name.toString()), 
                accountEmail: Text(controller.userModel.email.toString()),
                currentAccountPicture: CircleAvatar(
                  child: (controller.userModel.photoUrl == null) 
                  ? Image.network(
                    controller.userModel.photoUrl,
                    
                  ) : Text(controller.userModel.name.substring(0,1)),
                ),
              ),

              DrawerTile(
                highlighted: pageStore.page == 0,
                icon: Icons.home,
                text: "Home",
                page: 0,
                onTap: () {
                  pageStore.changePage(0);
                },
              ),
              Divider(),
              DrawerTile(
                highlighted: pageStore.page == 1,
                icon: Icons.group_add,
                text: "52 weeks goal",
                page: 1,
                onTap: () {
                  pageStore.changePage(1);
                }
              ),
              Divider(),

              DrawerTile(
                highlighted: pageStore.page == 2,
                icon: Icons.money_off,
                text: "Debts",
                page: 1,
                onTap: () {
                  pageStore.changePage(2);
                }
              ),
              Divider(),

              DrawerTile(
                highlighted: pageStore.page == 3,
                icon: Icons.settings,
                text: "Settings",
                page: 2,
                onTap: () {
                  pageStore.changePage(3);
                }
              ),
              Divider(),
              DrawerTile(
                highlighted: false,
                icon: Icons.exit_to_app,
                text: "Sair",
                page: 4,
                onTap: () {
                  controller.logoff();
                }
              ),
            ]
          ),
        ),
      ),
    );
  }
}

Widget _buildDrawerBack(BuildContext context) => Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    )
  ),
);