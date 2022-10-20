import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_event.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';

class SecondPageViewModel extends ChangeNotifier with BaseViewModel {
  final CharactersBloc _charactersBloc = CharactersBloc();
  StreamSubscription? _charactersBlocSubscription;

  SecondPageViewModel() {
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

  void clear() {
    _charactersBloc.add(CharactersClearEvent());
  }

  List<CharacterModel>? get allCharacters =>
      _charactersBloc.state.loadedCharacter;

  bool get isCharactersLoading => _charactersBloc.state.isLoadind;
}
