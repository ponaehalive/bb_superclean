import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'package:superclean/domain/bloc/episodes/episodes_event.dart';
import 'package:superclean/domain/models/episode_model.dart';

import 'package:superclean/service_locator.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';

class SeasonsListViewModel extends ChangeNotifier with BaseViewModel {
  final _episodesBloc = ServiceLocator.instace.episodesBloc;
  final _appRouter = ServiceLocator.instace.router;

  StreamSubscription? _episodesBlocSubscription;

  SeasonsListViewModel() {
    _episodesBlocSubscription =
        _episodesBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    super.dispose();
    _episodesBlocSubscription?.cancel();
  }

  void init() {
    if (allBBEpisodes.isEmpty) {
      _episodesBloc.add(
        BBEpisodesLoadEvent(),
      );
    }
  }

  List<EpisodeModel> get allBBEpisodes =>
      _episodesBloc.state.loadedBBEpisodes ?? [];

  void clear() {}

  void goToCharacterInfoPage() {}

  bool get isAllBBEpisodesLoading => _episodesBloc.state.isLoadind ?? false;

}
