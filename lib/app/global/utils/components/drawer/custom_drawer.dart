import '../../../controllers/app_controller.dart';
import '../../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'widgets/drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Drawer(
              child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  Obx(() => UserAccountsDrawerHeader(
                        accountName:
                            Text('${appController.getUser.value?.name}'),
                        accountEmail:
                            Text('${appController.getUser.value?.email}'),
                        currentAccountPicture: CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              (appController.getUser.value!.urlImage != null)
                                  ? NetworkImage(
                                      appController.getUser.value!.urlImage!,
                                    )
                                  : null,
                          child: (appController.getUser.value!.urlImage != null)
                              ? Container()
                              : Text('${appController.getUser.value?.email}'
                                  .substring(0, 1)
                                  .toUpperCase()),
                        ),
                      )),
                  Obx(() => DrawerTile(
                        highlighted: !(appController.page.value == 0),
                        icon: FontAwesomeIcons.home,
                        text: "Home",
                        page: 0,
                        onTap: () {
                          appController.changePage(0);
                          Navigator.pop(context);
                          Get.offNamed(Routes.HOME);
                        },
                      )),
                  const Divider(),
                  Obx(() => DrawerTile(
                      highlighted: !(appController.page.value == 1),
                      icon: FontAwesomeIcons.calendarWeek,
                      text: "52 weeks goal",
                      page: 1,
                      onTap: () {
                        appController.changePage(1);
                        Navigator.pop(context);
                        Get.offNamed(Routes.YEAR_GOAL_CHALLENGE);
                      })),
                  const Divider(),
                  Obx(() => DrawerTile(
                      highlighted: !(appController.page.value == 2),
                      icon: FontAwesomeIcons.handHoldingUsd,
                      text: "Debts",
                      page: 2,
                      onTap: () {
                        appController.changePage(2);
                        Navigator.pop(context);
                        Get.offNamed(Routes.DEBTS);
                      })),
                  const Divider(),
                  Obx(() => DrawerTile(
                      highlighted: !(appController.page.value == 3),
                      icon: FontAwesomeIcons.cog,
                      text: "Settings",
                      page: 3,
                      onTap: () {
                        appController.changePage(3);
                        Navigator.pop(context);
                        Get.offNamed(Routes.SETTINGS);
                      })),
                  const Divider(),
                  DrawerTile(
                      highlighted: true,
                      icon: FontAwesomeIcons.signOutAlt,
                      text: "Sair",
                      page: 4,
                      onTap: () {
                        Navigator.pop(context);
                        appController.auth.logout();
                        // authController.logout();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              const Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Versão 1.0.0'),
                ),
              ),
            ],
          ))),
    );
  }
}
