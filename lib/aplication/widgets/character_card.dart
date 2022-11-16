import 'package:flutter/material.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/end_points.dart';

class CharacterCardWidget extends StatelessWidget {
  final CharacterModel character;
  final void Function()? onTap;

  const CharacterCardWidget({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(
                1.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              CustomImage(
                //character.image,

                (character.profilePath != null)
                    ? TMDBEndPoints.image + character.profilePath!
                    : '',
                height: double.infinity,
                width: double.infinity,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          //character.name ?? '',
                          character.character ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppColors.primaryText),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
