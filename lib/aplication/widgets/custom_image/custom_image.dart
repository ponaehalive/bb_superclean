
import 'package:flutter/material.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image_builder.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image_loader.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image_placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
    this.image, {super.key, 
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.useBlurBackground = false,
  });

  final String? image;

  final double width;
  final double height;
  final BoxFit fit;
  final Alignment alignment;

  final bool useBlurBackground;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return CustomImagePlaceholder(
        height: height,
        width: width,
      );
    }

    return CachedNetworkImage(
      imageUrl: image!,
      imageBuilder: (context, imageProvider) {
        return CustomImageBuilder(
          imageProvider,
          height: height,
          width: width,
          fit: fit,
          alignment: alignment,
          useBlurBackground: useBlurBackground,
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return CustomImageLoader(
          height: height,
          width: width,
        );
      },
      errorWidget: (context, url, error) {
        return CustomImagePlaceholder(
          height: height,
          width: width,
        );
      },
    );
  }
}
