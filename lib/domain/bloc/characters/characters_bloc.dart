import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_event.dart';
import 'package:superclean/domain/bloc/characters/characters_state.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/characters_repository.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository = CharacterRepository();
  CharactersBloc() : super(CharactersState.initial) {
    on<CharactersLoadEvent>(
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
