import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(
    this.icon, {
    super.key,
    this.onTap,
    this.width = 48.0,
    this.height = 48.0,
    this.iconWidth = 24.0,
    this.iconHeight = 24.0,
    this.margin = EdgeInsets.zero,
    this.background = Colors.transparent,
    this.iconColor = AppColors.darkText,
  });

  final String icon;
  final double width;
  final double height;
  final double iconWidth;
  final double iconHeight;
  final Color background;
  final EdgeInsets margin;
  final Color iconColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        alignment: Alignment.center,
        child: SizedBox(
          width: iconWidth,
          height: iconHeight,
          child: SvgPicture.asset(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
