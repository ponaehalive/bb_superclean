import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_event.dart';
import 'package:superclean/domain/bloc/characters/characters_state.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/characters_repository.dart';
import 'package:superclean/domain/services/secure_auth_data.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final _secureAuthData = SecureAuthData();


  final CharacterRepository characterRepository = CharacterRepository();
  CharactersBloc() : super(CharactersState.initial) {
    on<CharactersLoadEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoadind: true,
          ),
        );

        {
          final List<CharacterModel> loadedCharactersList =
              await characterRepository.getAllCharacters();

          final sessionId = await _secureAuthData.getSessionId();
          print('opopopo sessionId $sessionId');

          emit(
            state.copyWith(
              loadedCharacter: loadedCharactersList,
              isLoadind: false,
            ),
          );
        }
      },
    );
    on<CharacterSelectEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            selectedCharacter: event.selectedCharacter,
          ),
        );
      },
    );
  }
}
