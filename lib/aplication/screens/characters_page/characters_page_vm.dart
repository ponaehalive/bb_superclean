import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_event.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';
import 'package:auto_route/auto_route.dart';

class CharactersPageViewModel extends ChangeNotifier with BaseViewModel {
  final CharactersBloc _charactersBloc = CharactersBloc();
  StreamSubscription? _charactersBlocSubscription;

  CharactersPageViewModel() {
    _charactersBlocSubscription =
        _charactersBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    super.dispose();
    _charactersBlocSubscription?.cancel();
  }

  void init() {
    _charactersBloc.add(
      CharactersLoadEvent(),
    );
  }

  void clear() {}

  void selectCharacter(CharacterModel selectedCharacter, BuildContext context) {
    _charactersBloc.add(
      CharactersSelectEvent(selectedCharacter: selectedCharacter),
    );
    print(selectedCharacter.actorName);
    context.router.push(const CharacterDetailsRoute());
  }

  void goToCharacterInfoPage() {}

  List<CharacterModel> get allCharacters =>
      _charactersBloc.state.loadedCharacter ?? [];

  bool get isCharactersLoading => _charactersBloc.state.isLoadind ?? false;

  CharacterModel? get selectedCharacter =>
      _charactersBloc.state.selectedCharacter;
}
