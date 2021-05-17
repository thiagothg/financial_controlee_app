part of 'app_title_bar.dart';

class _AppTitleBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bool showBackBtn = context.select((BooksModel m) => m.currentBookId) != null;
    return Stack(children: [
      Row(
        children: [
          // if (showBackBtn) _BackBtn(),
          Spacer(),
          TouchModeToggleBtn(invertPopupAlign: true),
          _AdaptiveProfileBtn(invertRow: true, useBottomSheet: true),
        ],
      ),
      Center(child: _TitleText()),
    ]);
  }
}
