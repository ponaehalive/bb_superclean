import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/service_locator.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';
import 'package:superclean/src/utils/date_time_formatter.dart';

class CharacterDeatilsViewModel extends ChangeNotifier with BaseViewModel {
  final charactersBloc = ServiceLocator.instace.charactersBloc;
  final _appRouter = ServiceLocator.instace.router;

  StreamSubscription? _charactersBlocSubscription;

  CharacterDeatilsViewModel() {
    _charactersBlocSubscription =
        charactersBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    super.dispose();
    _charactersBlocSubscription?.cancel();
  }

  void init() {
    // ignore: avoid_print
    print('character details init');
  }

  void goToAllCharacters() {
    _appRouter.push(const CharactersRoute());
  }

  String? get birthDay {
    if (selectedCharacter!.birthDay != 'Unknown') {
      return AppFormatter.format(
          DateFormat('MM-dd-yyyy').parse(selectedCharacter?.birthDay ?? ''),
          AppFormatter.airdateFormat);
    }
    return 'Unknown';
  }

  CharacterModel? get selectedCharacter =>
      charactersBloc.state.selectedCharacter;

  bool get isCharactersLoading => charactersBloc.state.isLoadind ?? false;
}
