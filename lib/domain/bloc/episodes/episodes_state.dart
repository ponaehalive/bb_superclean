import 'package:superclean/domain/models/episode_model.dart';

class EpisodesState {
  List<EpisodeModel>? loadedBBEpisodes;
  bool? isLoadind;
  EpisodeModel? selectedEpisode;

  EpisodesState({
    this.loadedBBEpisodes,
    this.isLoadind,
    required this.selectedEpisode,
  });

  EpisodesState copyWith({
    List<EpisodeModel>? loadedEpisodes,
    bool? isLoadind,
    EpisodeModel? selectedEpisode,
  }) =>
      EpisodesState(
          loadedBBEpisodes: loadedEpisodes ?? this.loadedBBEpisodes,
          isLoadind: isLoadind ?? this.isLoadind,
          selectedEpisode: selectedEpisode ?? this.selectedEpisode);

  static EpisodesState get initial {
    return EpisodesState(
      loadedBBEpisodes: [],
      isLoadind: false,
      selectedEpisode: EpisodeModel(),
    );
  }
}
