import 'package:superclean/domain/models/character_model.dart';

class CharactersState {
  List<CharacterModel>? loadedCharacter;
  bool? isLoadind;
  CharacterModel selectedCharacter;

  CharactersState({
    this.loadedCharacter,
    this.isLoadind,
    required this.selectedCharacter,
  });

  static CharactersState get initial {
    return CharactersState(
      loadedCharacter: [],
      isLoadind: false,
      selectedCharacter: CharacterModel(),
    );
  }
}
