import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

class CustomImagePlaceholder extends StatelessWidget {
  const CustomImagePlaceholder({
    super.key,
    required this.height,
    required this.width,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.grey,
      ),
      child: Center(
        child: SizedBox(
          height: height / 2.25,
          child: SvgPicture.asset(
            'assets/images/stranger.svg',
          ),
        ),
      ),
    );
  }
}
