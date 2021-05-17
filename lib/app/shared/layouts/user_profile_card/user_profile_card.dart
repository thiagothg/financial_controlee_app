import 'dart:async';

import 'package:financialcontroleeapp/app/shared/utils/input_utils.dart';
import 'package:financialcontroleeapp/app/shared/widgets/style/buttons/styled_buttons.dart';
import 'package:financialcontroleeapp/app/shared/widgets/style/styled_spacers.dart';
import 'package:flutter/material.dart';
import '../../../core/core_packages.dart';

class UserProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AppTheme theme = context.watch();
    return GestureDetector(
      onTap: InputUtils.unFocus,
      child: Container(
          width: 280,
          height: 380,
          child: Stack(
            children: [
              // Positioned.fill(
              //     child: AnimatedFractionalOffset(
              //   duration: Times.medium,
              //   curve: Curves.easeOut,
              //   begin: Offset(0, -1),
              //   end: Offset(0, 0),
              //   child: Container(
              //     padding: EdgeInsets.only(left: Insets.lg, right: Insets.lg, top: Insets.med),
              //     decoration: BoxDecoration(
              //       color: theme.surface1,
              //       borderRadius: BorderRadius.vertical(bottom: Corners.smRadius),
              //     ),
              //     child: _ProfileEditorCardContent(),
              //   ),
              // )),
              _TopShadow(),
            ],
          )),
    );
  }
}

class BottomSheetProfileEditorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.xl),
      child: _ProfileEditorCardContent(bottomSheet: true),
    );
  }
}

class _ProfileEditorCardContent extends StatefulWidget {
  _ProfileEditorCardContent({this.bottomSheet = false});

  final bool bottomSheet;

  @override
  State createState() => _ProfileEditorCardContentState();
}

class _ProfileEditorCardContentState extends State<_ProfileEditorCardContent> {
  // AppUser? _user;

  @override
  void dispose() {
    super.dispose();
    // When we're closed, submit any changes to the user.
    // Use a microtask cause this will trigger some builds.
    // TODO: remove this after AppRouter re-write
    // if (_user != null) {
    //   scheduleMicrotask(() {
    //     UpdateUserCommand().run(_user!);
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    // _user = context.select((AppModel m) => m.currentUser);
    // AppTheme theme = context.watch();

    // if (_user == null) return Container();

    return SingleChildScrollView(
      child: Stack(
        children: [
          // Align(alignment: Alignment.centerLeft, child: UiText("v" + AppModel.kVersion, style: TextStyles.caption)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SimpleBtn(
                cornerRadius: 99,
                onPressed: _handleProfileImgPressed,
                child: SizedBox(
                  height: 80 + Insets.xs * 2,
                  child: Padding(
                    padding: EdgeInsets.all(Insets.xs),
                    // child: StyledCircleImage(url: _user?.imageUrl ?? AppUser.kDefaultImageUrl),
                  ),
                ),
              ),

              /// Upload PhotoBtn
              SimpleBtn(
                onPressed: _handleProfileImgPressed,
                child: Padding(
                  padding: EdgeInsets.all(Insets.sm),
                  child: Text(
                    "Update Photo",
                    // style:
                    //     TextStyles.caption.copyWith(color: theme.mainTextColor, decoration: TextDecoration.underline),
                  ),
                ),
              ),
              VSpace.lg,

              /// TextInputs
              // LabeledTextInput(
              //     autoFocus: true, label: "First Name", text: _user?.firstName, onChanged: _handleFirstNameChanged),
              VSpace.lg,
              // LabeledTextInput(label: "Last Name", text: _user?.lastName, onChanged: _handleLastNameChanged),
              VSpace.lg,

              /// Account
              // Container(width: double.infinity, child: UiText("Account", style: TextStyles.caption)),
              // Row(
              //   children: [
              //     Expanded(child: UiText(_user?.email, style: TextStyles.body3)),
              //     PrimaryBtn(
              //         icon: Icons.logout,
              //         leadingIcon: false,
              //         label: "LOGOUT",
              //         isCompact: true,
              //         onPressed: _handleLogoutPressed)
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleProfileImgPressed() async {
    // List<PickedImage> paths = await PickImagesCommand().run();
    // CloudStorageService cloudStorage = context.read<CloudStorageService>();
    // List<CloudinaryResponse> uploads = await cloudStorage.multiUpload(images: paths);

    // Make a command that picks images, uploads them, and returns a list of remote paths?

    // uploads.forEach((u) => safePrint(u.secureUrl));
    // // Update firebase
    // if (uploads.isNotEmpty) {
    //   AppModel m = context.read();
    //   if (m.currentUser != null) {
    //     UpdateUserCommand().run(m.currentUser!.copyWith(imageUrl: uploads[0].secureUrl));
    //   }
    //   m.scheduleSave();
    // }
  }

  void _handleFirstNameChanged(String value) {
    // _user = _user?.copyWith(firstName: value) ?? _user;
  }

  void _handleLastNameChanged(String value) {
    // _user = _user?.copyWith(lastName: value) ?? _user;
  }

  void _handleLogoutPressed() {
    if (widget.bottomSheet) {
      Navigator.pop(context);
    } else {
      // ClosePopoverNotification().dispatch(context);
    }
    // SetCurrentUserCommand().run(null);
  }
}

class _TopShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRect(
        child: FractionalTranslation(
          translation: Offset(0, -1),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red, 
              boxShadow: Shadows.universal
            )
          )
        ),
      ),
    );
  }
}
