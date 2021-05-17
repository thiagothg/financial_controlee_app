part of 'app_title_bar.dart';


class _AppTitleBarDesktop extends StatelessWidget {

  // final ≈ = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    // Determine whether to show back button. 
    //We don't want to show it for "guest" users
    // bool isGuestUser = context.select((AppModel m) => m.isGuestUser);
    // bool canGoBack = context.select((AppModel m) => m.canPopNav);
    var showBackBtn = false; //isGuestUser == false && canGoBack;
    var appWidth = context.widthPx;
    // Mac title bar has a different layout as it's window btns are left aligned
    var isMac = DeviceOS.isMacOS;
    var isMobile = DeviceOS.isMobile;
    var showTouchToggle = true; 
    //context.select((AppModel m) => m.hasUser) == true;

    return Stack(
      children: [
      // Centered TitleText
      if (appWidth > 400) Center(child: _TitleText()),
      // Btns
      Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isMac) ...[
            HSpace(80), // Reserve some space for the native btns
            if (showBackBtn)  _BackBtn(),
            Spacer(),
            if (showTouchToggle) TouchModeToggleBtn(invertPopupAlign: isMac),
            HSpace.sm,
            _AdaptiveProfileBtn(invertRow: true, useBottomSheet: isMobile),
          ] else ...[
            // Linux and Windows are left aligned and simple
            _AdaptiveProfileBtn(useBottomSheet: isMobile),
            if (showTouchToggle) TouchModeToggleBtn(invertPopupAlign: isMac),
            HSpace.sm,
            if (showBackBtn) _BackBtn(),
          ]
        ],
      ),
    ]);
  }
}
