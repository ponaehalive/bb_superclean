import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_event.dart';
import 'package:superclean/domain/models/character_model.dart';

import 'package:superclean/src/base_elements/base_view_model.dart';

class CharactersPageViewModel extends ChangeNotifier with BaseViewModel {
  final _charactersBloc = GetIt.instance<CharactersBloc>();

  final _appRouter = GetIt.instance<AppRouter>();
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
    // ignore: avoid_print
    print('Init all characters page');
    if (allCharacters.isEmpty) {
      _charactersBloc.add(
        CharactersLoadEvent(),
      );
    }
  }

  void clear() {}

  void selectCharacter(CharacterModel selectedCharacter) {
    _charactersBloc.add(
      CharacterSelectEvent(selectedCharacter: selectedCharacter),
    );

    _appRouter.push(
      const CharacterDetailsRoute(),
    );
  }

  void goToCharacterInfoPage() {}

  List<CharacterModel> get allCharacters =>
      _charactersBloc.state.loadedCharacter ?? [];

  bool get isCharactersLoading => _charactersBloc.state.isLoadind ?? false;

  CharacterModel? get selectedCharacter =>
      _charactersBloc.state.selectedCharacter;
}
