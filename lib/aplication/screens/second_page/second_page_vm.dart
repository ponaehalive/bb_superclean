import 'package:flutter/cupertino.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_event.dart';
import 'package:superclean/domain/bloc/characters/characters_state.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/characters_repository.dart';

import 'package:superclean/src/base_elements/base_view_model.dart';

class SecondPageViewModel extends ChangeNotifier with BaseViewModel {

  final CharactersBloc _charactersBloc = CharactersBloc();

  //SecondPageViewModel(
  //this._charactersBloc,
  //);

  bool? someBool = true;

  String peremen2 = 'urarara';

  void change2() {
    peremen2 = 'nononon';
    notifyListeners();
  }

  void init() {
    //print('init 2 page');
    _charactersBloc
      .add(
        CharactersLoadEvent(),
      ); 

   
  }
 List<CharacterModel>? get allCharacters =>
      _charactersBloc.state.listOfAllCharacters;

  
}
