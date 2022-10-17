
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

class CustomImagePlaceholder extends StatelessWidget {
  const CustomImagePlaceholder({super.key, 
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
        color: AppColors.blue,
      ),
      child: Center(
        child: SizedBox(
          height: height / 2.25,
          child: const SizedBox(),
          //SvgPicture.asset(
          //  theme.icons.calendar,
          //  color: AppColors.,
         // ),
        ),
      ),
    );
  }
}
