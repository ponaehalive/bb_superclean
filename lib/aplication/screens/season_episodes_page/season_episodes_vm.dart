import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/models/episode_model.dart';
import 'package:superclean/service_locator.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';

class SeasonEpisodesViewModel extends ChangeNotifier with BaseViewModel {
  final _episodesBloc = ServiceLocator.instace.episodesBloc;
  final _appRouter = ServiceLocator.instace.router;

  StreamSubscription? _episodesBlocSubscription;

  SeasonEpisodesViewModel() {
    _episodesBlocSubscription =
        _episodesBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    super.dispose();
    _episodesBlocSubscription?.cancel();
  }

  void init() {}

  List<EpisodeModel> get allBBEpisodes =>
      _episodesBloc.state.loadedBBEpisodes ?? [];

  void backToSeasonsList() {
    _appRouter.push(const SeasonsListRoute());
  }

  void goToCharacterInfoPage() {}

  String? get selectedSeason => _episodesBloc.state.selectedSeasonNumber;

  bool get isAllBBEpisodesLoading => _episodesBloc.state.isLoadind ?? false;

  List<EpisodeModel>? get selectedSeasonList =>
      _episodesBloc.state.selectedSeasonEpisodes;

  String get appBarText =>
      'Season ${_episodesBloc.state.selectedSeasonNumber} Episodes';
}
