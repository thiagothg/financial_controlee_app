import 'package:animate_do/animate_do.dart';
import 'package:financialcontroleeapp/app/models/user_model.dart';
import 'package:financialcontroleeapp/app/shared/auth/auth_controller.dart';
import 'package:financialcontroleeapp/app/shared/layouts/app_title_bar/touch_mode_toggle_btn.dart';
import 'package:financialcontroleeapp/app/shared/layouts/user_profile_card/user_profile_card.dart';
import 'package:financialcontroleeapp/app/shared/utils/input_utils.dart';
import 'package:financialcontroleeapp/app/shared/widgets/circle_avatar.dart';
import 'package:financialcontroleeapp/app/shared/widgets/popover/popover_region.dart';
import 'package:financialcontroleeapp/app/shared/widgets/style/app_logo_text.dart';
import 'package:financialcontroleeapp/app/shared/widgets/style/buttons/styled_buttons.dart';
import 'package:financialcontroleeapp/app/shared/widgets/style/styled_spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core_packages.dart';
import '../../utils/device_info.dart';
import '../../widgets/native_window_utils/window_utils.dart';
import '../../widgets/style/shadowed_box.dart';
import '../styled_bottom_sheet.dart';

part 'app_title_bar_desktop.dart';
part 'app_title_bar_mobile.dart';


class AppTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // Optionally wrap the content in a Native title bar. 
    //This may be a no-op depending on platform.
    return IoUtils.instance.wrapNativeTitleBarIfRequired(ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40),
      child: Stack(
        children: [
          // All titlebars share a bg
          ShadowedBg(Theme.of(context).primaryColorLight),
          // Switch between mobile and desktop title bars
          if (DeviceOS.isDesktopOrWeb) ...[
            _AppTitleBarDesktop(),
          ] else ...[
            _AppTitleBarMobile(),
          ]
        ],
      ),
    ));
  }
}

class _TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: AppLogoText(
          constraints: BoxConstraints(maxHeight: 16)
        )
      ),
    );
  }
}

class _BackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AppTheme theme = Provider.of(context);
    return FadeInDown(
      child: SimpleBtn(
      onPressed: () => handleBackPressed(context),
      child: Container(
        height: double.infinity,
        child: Row(
          children: [
            Icon(Icons.chevron_left),
            Text("Back", 
              style: TextStyles.body2.copyWith(
                color: Color(0xff333333)
              )
            ),
            HSpace.med
          ],
        ),
      ),
    ));
  }

  void handleBackPressed(BuildContext context) {
    InputUtils.unFocus();
    // context.read<AppModel>().popNav();
  }
}

class _AdaptiveProfileBtn extends StatelessWidget {
  const _AdaptiveProfileBtn({Key? key, 
    this.useBottomSheet = false, 
    this.invertRow = false
  }) : super(key: key);
  
  final bool useBottomSheet;
  final bool invertRow;
  @override
  Widget build(BuildContext context) {
    var auth = Modular.get<AuthController>();
    UserModel? user = auth.userModel;

    if (user == null) return Container();

    //
    Widget profileIcon = StyledCircleImage(
      padding: EdgeInsets.all(Insets.xs), 
      url: user.image ?? UserModel.kDefaultImageUrl
    );

    return useBottomSheet
      ? SimpleBtn(
          ignoreDensity: true, 
          onPressed: () => _showProfileSheet(context), child: profileIcon
        )
      : PopOverRegion.click(
        popChild: ClipRect(
          child: UserProfileCard(),
          //child: Container(width: 100, height: 100, color: Colors.red),
        ),
        popAnchor: invertRow ? Alignment.topRight : Alignment.topLeft,
        anchor: invertRow ? Alignment.bottomRight : Alignment.bottomLeft,
        child: profileIcon
    );
  }

  void _showProfileSheet(BuildContext context) {
    showStyledBottomSheet(context, child: BottomSheetProfileEditorCard());
  }
}
