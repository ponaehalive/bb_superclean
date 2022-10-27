import 'package:superclean/domain/models/character_model.dart';

abstract class CharactersEvent {}

class CharactersLoadEvent extends CharactersEvent {}

class CharacterSelectEvent extends CharactersEvent {
  final CharacterModel selectedCharacter;
  CharacterSelectEvent({
    required this.selectedCharacter,
  });
}
