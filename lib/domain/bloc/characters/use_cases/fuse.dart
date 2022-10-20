/* import 'package:superclean/domain/bloc/characters/characters_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_state.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/characters_repository.dart';

 class CharactersUse extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository = CharacterRepository();
  CharactersUse() : super(CharactersState.initial) {
    Future<void> newMethod() async {
      return on<CharactersLoadEvent>(
        (event, emit) async {
          emit(
            CharactersState(
              loadedCharacter: [],
              isLoadind: true,
            ),
          );

          {
            final List<CharacterModel> loadedCharactersList =
                await characterRepository.getAllCharacters();
            emit(
              CharactersState(
                loadedCharacter: loadedCharactersList,
                isLoadind: false,
              ),
            );
          }
        },
      );
    }
  }
}
 */

import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_state.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/characters_repository.dart';
import 'package:superclean/src/base_elements/base_event.dart';

abstract class LoadAllCharactersUseCase
    implements BaseEvent<CharactersState, CharactersBloc> {
  final CharacterRepository characterRepository = CharacterRepository();
  @override
  Future<void> execute(CharactersBloc bloc, dynamic emit) async {
    final List<CharacterModel> loadedCharactersList =
        await characterRepository.getAllCharacters();
    emit(
      CharactersState(
        loadedCharacter: loadedCharactersList,
        isLoadind: false,
      ),
    );
  }
}
