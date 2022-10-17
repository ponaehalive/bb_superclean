import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';

class FirstPageViewModel extends ChangeNotifier with BaseViewModel {
//final CatBloc userBloc = BlocProvider.of<CatBloc>(context);

/*
StreamSubscription? _charactersBlocSubscription;
final CharactersBloc _charactersProvidersBloc;

  FirstPageViewModel(
    this._charactersProvidersBloc,
  ) {
    _charactersBlocSubscription = _charactersProvidersBloc.stream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _charactersBlocSubscription?.cancel();
  }

 // void init() {
  //  if (_charactersProvidersBloc.state.listOfAllCharacters!.isEmpty) {
   //   _charactersProvidersBloc.add(CharactersEvent.loadAllCharacters());
 //   }
//  }


*/

  String peremen = 'urarara';

  void change() {
    peremen = 'nononon';
    notifyListeners();
  }

  void init() {
    print('init 1 page');
  }
}
