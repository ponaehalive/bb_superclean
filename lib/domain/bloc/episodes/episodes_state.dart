import 'package:superclean/domain/models/episode_model.dart';

class EpisodesState {
  List<EpisodeModel>? loadedBBEpisodes;
  bool? isLoadind;
  EpisodeModel? selectedEpisode;
  String? selectedSeasonNumber;

  EpisodesState({
    this.loadedBBEpisodes,
    this.isLoadind,
    required this.selectedEpisode,
    this.selectedSeasonNumber,
  });

  EpisodesState copyWith({
    List<EpisodeModel>? loadedBBEpisodes,
    bool? isLoadind,
    EpisodeModel? selectedEpisode,
    String? selectedSeasonNumber,
  }) =>
      EpisodesState(
        loadedBBEpisodes: loadedBBEpisodes ?? this.loadedBBEpisodes,
        isLoadind: isLoadind ?? this.isLoadind,
        selectedEpisode: selectedEpisode ?? this.selectedEpisode,
        selectedSeasonNumber: selectedSeasonNumber ?? this.selectedSeasonNumber,
      );

  static EpisodesState get initial {
    return EpisodesState(
        loadedBBEpisodes: [],
        isLoadind: false,
        selectedEpisode: EpisodeModel(),
        selectedSeasonNumber: '1');
  }

  List<EpisodeModel>? get selectedSeasonEpisodes {
    return [];

    /*   loadedBBEpisodes
        ?.where((episode) => episode.season == selectedSeasonNumber)
        .toList(); */
  }
}
