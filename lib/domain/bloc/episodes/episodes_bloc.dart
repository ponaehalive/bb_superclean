import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superclean/domain/bloc/episodes/episodes_event.dart';
import 'package:superclean/domain/bloc/episodes/episodes_state.dart';
import 'package:superclean/domain/models/episode_model.dart';
import 'package:superclean/domain/services/episodes_repository.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodesRepository episodesRepository = EpisodesRepository();
  EpisodesBloc() : super(EpisodesState.initial) {
    on<BBEpisodesLoadEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoadind: true,
          ),
        );

        {
          final List<EpisodeModel> loadedBBEpisodesList =
              await episodesRepository.getAllBBEpisodes();

          emit(
            state.copyWith(
              loadedBBEpisodes: loadedBBEpisodesList,
              isLoadind: false,
            ),
          );
        }
      },
    );
    on<SeasonSelectEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            selectedSeasonNumber: event.selectedSeasonNumber,
          ),
        );
      },
    ); 
  }
}
