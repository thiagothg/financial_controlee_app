import 'package:flutter/material.dart';
import '../../../../core/core_packages.dart';


import 'raw_styled_btn.dart';

export 'raw_styled_btn.dart';

/// Accent colored btn (orange), wraps RawBtn
class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn(
      {Key? key,
      required this.onPressed,
      this.label,
      this.icon,
      this.child,
      this.leadingIcon = false,
      this.isCompact = false,
      this.cornerRadius})
      : super(key: key);
  final Widget? child;
  final String? label;
  final IconData? icon;
  final bool leadingIcon;
  final bool isCompact;
  final double? cornerRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // AppTheme theme = context.watch();
    return RawBtn(
      cornerRadius: cornerRadius,
      normalColors: BtnColors(
        bg: Theme.of(context).accentColor, 
        fg: Theme.of(context).backgroundColor
      ),
      hoverColors: BtnColors(
        bg: Theme.of(context).focusColor, 
        fg: Theme.of(context).backgroundColor
      ),
      onPressed: onPressed,
      child: BtnContent(
        child: child, 
        label: label, 
        icon: icon, 
        leadingIcon: leadingIcon, 
        isCompact: isCompact
      ),
    );
  }
}

/// Surface colors btn (white), wraps RawBtn
class SecondaryBtn extends StatelessWidget {
  const SecondaryBtn({
    Key? key,
    required this.onPressed,
    this.label,
    this.icon,
    this.child,
    this.leadingIcon = false,
    this.isCompact = false,
    this.cornerRadius,
  }) : super(key: key);
  final Widget? child;
  final String? label;
  final IconData? icon;
  final bool leadingIcon;
  final bool isCompact;
  final double? cornerRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // AppTheme theme = context.watch();
    Widget content = BtnContent(
      child: child, 
      label: label, 
      icon: icon, 
      leadingIcon: leadingIcon, 
      isCompact: isCompact
    );

    if (isCompact) {
      return RawBtn(
          cornerRadius: cornerRadius,
          enableShadow: false,
          normalColors: BtnColors(
            bg: Theme.of(context).accentColor, 
            fg: Theme.of(context).backgroundColor,
            outline: Theme.of(context).shadowColor
          ),
          hoverColors: BtnColors(
            bg: Theme.of(context).focusColor.withOpacity(.15), 
            fg: Theme.of(context).focusColor,
            outline: Theme.of(context).focusColor
          ),
          onPressed: onPressed,
          child: content);
    }
    return RawBtn(
      normalColors: BtnColors(
        bg: Theme.of(context).backgroundColor, 
        fg: Theme.of(context).accentColor
      ),
      hoverColors: BtnColors(
        bg: Theme.of(context).backgroundColor, 
        fg: Theme.of(context).focusColor
      ),
      onPressed: onPressed,
      child: content,
    );
  }
}

/// Takes any child, applies no padding, and falls back to default colors
class SimpleBtn extends StatelessWidget {
  const SimpleBtn(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.focusMargin,
      this.normalColors,
      this.hoverColors,
      this.cornerRadius,
      this.ignoreDensity})
      : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  final double? focusMargin;
  final BtnColors? normalColors;
  final BtnColors? hoverColors;
  final double? cornerRadius;
  final bool? ignoreDensity;

  @override
  Widget build(BuildContext context) {
    return RawBtn(
      cornerRadius: cornerRadius,
      normalColors: normalColors,
      hoverColors: hoverColors,
      focusMargin: focusMargin ?? 0,
      child: child,
      enableShadow: false,
      onPressed: onPressed,
      ignoreDensity: ignoreDensity ?? true,
    );
  }
}

/// Text Btn - wraps a [SimpleBtn]
class TextBtn extends StatelessWidget {
  const TextBtn(this.label, {
    Key? key, 
    required this.onPressed, 
    this.isCompact = false,
     this.style, 
     this.showUnderline = false
  }) : super(key: key);

  final String label;
  final VoidCallback? onPressed;
  final bool isCompact;
  final TextStyle? style;
  final bool showUnderline;

  @override
  Widget build(BuildContext context) {
    var finalStyle = style ??
      TextStyles.caption.copyWith(
        decoration: showUnderline 
          ? TextDecoration.underline 
          : TextDecoration.none, 
        fontWeight: FontWeight.w500
      );

    return SimpleBtn(
      ignoreDensity: false,
      onPressed: onPressed,
      child: Text(label, style: finalStyle),
    );
  }
}

/// Icon Btn - wraps a [SimpleBtn]
class IconBtn extends StatelessWidget {
  const IconBtn(this.icon, {
    Key? key, 
    required this.onPressed, 
    this.color, 
    this.padding, 
    this.ignoreDensity
  }) : super(key: key);

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final EdgeInsets? padding;
  final bool? ignoreDensity;
  @override
  Widget build(BuildContext context) {
    var enableTouchMode =  false;
    //context.select((AppModel m) => m.enableTouchMode);
    var extraPadding = enableTouchMode ? 3 : 0;
    
    return SimpleBtn(
      ignoreDensity: ignoreDensity,
      child: AnimatedPadding(
        duration: Times.fast,
        curve: Curves.easeOut,
        padding: padding ?? EdgeInsets.all(Insets.xs + extraPadding),
        child: Icon(icon, color: color ?? Colors.black, size: 20),
      ),
      onPressed: onPressed
    );
  }
}
