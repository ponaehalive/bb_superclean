import 'package:superclean/domain/models/character_model.dart';

class CharactersState {
  List<CharacterModel>? loadedCharacter;
  bool isLoadind;

  CharactersState({
    required this.loadedCharacter,
    required this.isLoadind,
  });

  static CharactersState get initial {
    return CharactersState(
      loadedCharacter: [],
      isLoadind: false,
    );
  }
}
