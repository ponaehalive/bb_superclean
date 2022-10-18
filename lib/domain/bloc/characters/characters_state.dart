import 'package:superclean/domain/models/character_model.dart';

class CharactersState {
  List<CharacterModel>? loadedCharacter = [];
  bool isLoadind = false;
  CharactersState({
    this.loadedCharacter,
    required this.isLoadind,
  });
}
