import 'package:financialcontroleeapp/app/shared/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:statsfl/statsfl.dart';

import '../store/app_store.dart';
import '../widgets/layouts/context_menu_overlay.dart';
import 'app_title_bar/app_title_bar.dart';
import 'popover/popover_controller.dart';

class MainAppScaffold extends StatefulWidget {

  const MainAppScaffold({Key? key, 
    required this.pageNavigator, 
    required this.showAppBar
  }) : super(key: key);


  final bool showAppBar;
  final Widget pageNavigator;

  @override
  _MainAppScaffoldState createState() => _MainAppScaffoldState();
}

class _MainAppScaffoldState extends State<MainAppScaffold> {

  final appStore = GetIt.I<AppStore>();


  @override
  Widget build(BuildContext context) {
    print(Modular.to.path);
    var textDirection = appStore.textDirection;
    return Directionality(
      textDirection: textDirection,
      child: ContextMenuOverlay(
        child: Navigator(
          onPopPage: (route, result) {
              if (route.didPop(result)) return true;
              return false;
          },
          pages: [
            MaterialPage(
              child: Builder(
                builder: (_) {
                  return PopOverController(
                    child: _WindowBorder(
                      color: Color(0xff333333),
                      child: StatsFl(
                        isEnabled: false,
                        child: Scaffold(
                          backgroundColor: Theme.of(context)
                            .scaffoldBackgroundColor,
                          body: SafeArea(
                            child: Column(
                              verticalDirection: VerticalDirection.up,
                              children: [
                                // Bottom content area
                                Expanded(child: widget.pageNavigator),
                                // Top-aligned TitleBar
                                if (widget.showAppBar) AppTitleBar(),
                              ],
                            )
                          )
                        ),
                      ),
                    ),
                  );
                },
              )
            ),
          ]
        ),
      ),
    );
  }
}

class _WindowBorder extends StatelessWidget {
  const _WindowBorder({Key? key, 
    required this.child, 
    required this.color
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(.1), width: 1),
          ),
        ),
      ),
    ]);
  }
}
