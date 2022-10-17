
import 'package:flutter/material.dart';

import 'package:superclean/aplication/ui/themes/app_colors.dart';

class CustomImageLoader extends StatelessWidget {
  const CustomImageLoader({super.key, 
    required this.height,
    required this.width,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
     
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          color: AppColors.green,
        ),
      ),
    );
  }
}
