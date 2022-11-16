// ignore_for_file: avoid_print

import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/provider.dart';

class ActorRepository {
  final Provider _provider = Provider();
  Future<List<ActorModel>> getAllActors() async {
    final characters = await _provider.getCharacters();

    final charactersList =
        characters.map((character) => ActorModel.fromJson(character)).toList();

    return charactersList;
  }

// for http response
//Future<List<CharacterModel>> getAllCharacters() => _characterProvider.getCharacters();
}
