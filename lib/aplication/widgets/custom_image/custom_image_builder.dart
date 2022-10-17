import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

class CustomImageBuilder extends StatelessWidget {
  const CustomImageBuilder(
    this.imageProvider, {super.key, 
    required this.height,
    required this.width,
    required this.fit,
    this.alignment = Alignment.center,
    this.useBlurBackground = false,
  });

  final ImageProvider imageProvider;
  final double width;
  final double height;
  final BoxFit fit;
  final Alignment alignment;

  final bool useBlurBackground;

  @override
  Widget build(BuildContext context) {
    if (useBlurBackground) {
      return SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: height,
              child: ClipRect(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: 3,
                      sigmaX: 3,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: height,
                      color: AppColors.darkText.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    );
  }
}
