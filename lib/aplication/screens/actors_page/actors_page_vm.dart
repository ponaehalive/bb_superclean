import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/actors/actors_bloc.dart';
import 'package:superclean/domain/bloc/actors/actors_event.dart';
import 'package:superclean/domain/models/character_model.dart';

import 'package:superclean/src/base_elements/base_view_model.dart';

class ActorsPageViewModel extends ChangeNotifier with BaseViewModel {
  final _actorsBloc = GetIt.instance<ActorsBloc>();

  final _appRouter = GetIt.instance<AppRouter>();
  StreamSubscription? _actorsBlocSubscription;

  ActorsPageViewModel() {
    _actorsBlocSubscription =
        _actorsBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    super.dispose();
    _actorsBlocSubscription?.cancel();
  }

  void init() {
    // ignore: avoid_print
    print('Init all characters page');
    if (allActors.isEmpty) {
      _actorsBloc.add(
        ActorsLoadEvent(),
      );
    }
  }

  void clear() {}

  void selectCharacter(ActorModel selectedActor) {
    _actorsBloc.add(
      ActorSelectEvent(selectedActor: selectedActor),
    );

    _appRouter.push(
      const CharacterDetailsRoute(),
    );
  }

  void goToCharacterInfoPage() {}

  List<ActorModel> get allActors => _actorsBloc.state.loadedActors ?? [];

  bool get isActorsLoading => _actorsBloc.state.isLoadind ?? false;

  ActorModel? get selectedCharacter => _actorsBloc.state.selectedActor;
}
