import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/models/episode_model.dart';
import 'package:superclean/service_locator.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';
import 'package:superclean/src/utils/date_time_formatter.dart';

class EpisodeInfoViewModel extends ChangeNotifier with BaseViewModel {
  final _episodesBloc = ServiceLocator.instace.episodesBloc;
  final _appRouter = ServiceLocator.instace.router;

  StreamSubscription? _episodesBlocSubscription;

  EpisodeInfoViewModel() {
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

  void backToSelectedSeasonEpisodes() {
    _appRouter.push(const SeasonEpisodesPageRouter());
  }

  void goToCharacterInfoPage() {}

  String? get selectedSeason => _episodesBloc.state.selectedSeasonNumber;

  bool get isAllBBEpisodesLoading => _episodesBloc.state.isLoadind ?? false;

  List<EpisodeModel>? get selectedSeasonList =>
      _episodesBloc.state.selectedSeasonEpisodes;

  EpisodeModel? get selectedEpisode => _episodesBloc.state.selectedEpisode;

  String? get airDayFormatted {
    if (_episodesBloc.state.selectedEpisode?.airDate != 'Unknown') {
      return AppFormatter.format(
          DateFormat('MM-dd-yyyy')
              .parse(_episodesBloc.state.selectedEpisode?.airDate ?? ''),
          AppFormatter.airdateFormat);
    }
    return 'Unknown';
  }

  String get appBarText =>
      'Season ${_episodesBloc.state.selectedSeasonNumber} Episodes';
}
