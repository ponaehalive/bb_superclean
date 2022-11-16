import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
//import 'package:pod_player/pod_player.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/episodes/episodes_bloc.dart';
import 'package:superclean/domain/models/episode_model.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';
import 'package:superclean/src/utils/date_time_formatter.dart';

class EpisodeInfoViewModel extends ChangeNotifier with BaseViewModel {
 

  final _episodesBloc = GetIt.instance<EpisodesBloc>();
  final _appRouter = GetIt.instance<AppRouter>();

  final String? recording = 'https://youtu.be/A3ltMaM6noM';

  /* 
  PodPlayerController controller = PodPlayerController(
    playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/A3ltMaM6noM'),
  );
 */
  StreamSubscription? _episodesBlocSubscription;

  EpisodeInfoViewModel() {
    _episodesBlocSubscription =
        _episodesBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    //print('dispose trailer');

    super.dispose();
    _episodesBlocSubscription?.cancel();
  }

  void init() {}

  /*  void playVideo() {
    print('trailer tab init');
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/A3ltMaM6noM'),
    )..initialise();
  } */

  List<EpisodeModel> get allBBEpisodes =>
      _episodesBloc.state.loadedBBEpisodes ?? [];

  void backToSelectedSeasonEpisodes() {
    //not work
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

  List<dynamic> get characters =>
     // _episodesBloc.state.selectedEpisode?.characters ?? 
      [];
}
