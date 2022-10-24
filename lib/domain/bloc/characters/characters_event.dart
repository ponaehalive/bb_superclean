import 'package:superclean/domain/models/character_model.dart';

abstract class CharactersEvent {}

class CharactersLoadEvent extends CharactersEvent {}

class CharactersSelectEvent extends CharactersEvent {
  final CharacterModel? selectedCharacter;
  CharactersSelectEvent({
    required this.selectedCharacter,
  });
}
