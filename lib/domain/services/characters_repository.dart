// ignore_for_file: avoid_print

import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/provider.dart';

class CharacterRepository {
  final Provider _provider = Provider();
  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await _provider.getCharacters();
    print("characters Repository:$characters");

    final charactersList = characters
        .map((character) => CharacterModel.fromJson(character))
        .toList();
    
    return charactersList;
  }

// for http response
//Future<List<CharacterModel>> getAllCharacters() => _characterProvider.getCharacters();
}
