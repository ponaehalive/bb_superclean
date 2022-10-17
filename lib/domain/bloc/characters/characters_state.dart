

import 'package:superclean/domain/models/character_model.dart';

abstract class CharactersState {}

class CharactersEmptyState extends CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersLoadedState extends CharactersState {
  List<CharacterModel> loadedCharacter;
  CharactersLoadedState({
    required this.loadedCharacter,
  });
}

class CharactersErrorState extends CharactersState {}



