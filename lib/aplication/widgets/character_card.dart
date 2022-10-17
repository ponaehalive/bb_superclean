
import 'package:flutter/material.dart';
import 'package:superclean/aplication/widgets/custom_image/custom_image.dart';
import 'package:superclean/domain/models/character_model.dart';

class CharacterCardWidget extends StatelessWidget {
  final CharacterModel character;
  final void Function()? onTap;

  const CharacterCardWidget({super.key, 
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
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              blurRadius: 2.0,
              offset: Offset(
                1.0,
                1.0,
              ), // shadow direction: bottom right
            )
          ],
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(color: Colors.green, width: 0.3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              CustomImage(
                character.image,
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
                          character.name ?? '',
                          textAlign: TextAlign.center,
                          
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