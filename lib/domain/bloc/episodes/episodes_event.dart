import 'package:superclean/domain/models/episode_model.dart';

abstract class EpisodesEvent {}

class BBEpisodesLoadEvent extends EpisodesEvent {}



class EpisodeSelectEvent extends EpisodesEvent {
  final EpisodeModel selectedEpisode;
  EpisodeSelectEvent({
    required this.selectedEpisode,
  });
}


class SeasonSelectEvent extends EpisodesEvent {
  final String? selectedSeasonNumber;
  SeasonSelectEvent({
    required this.selectedSeasonNumber,
  });
}