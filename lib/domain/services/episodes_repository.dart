// ignore_for_file: avoid_print

import 'package:superclean/domain/models/episode_model.dart';
import 'package:superclean/domain/services/provider.dart';

class EpisodesRepository {
  final Provider _provider = Provider();
  Future<List<EpisodeModel>> getAllBBEpisodes() async {
    
    final episodes = await _provider.getAllBBEpisodes();


   

    final bbEpisodesList = episodes
        .map((episode) => EpisodeModel.fromJson(episode))
        .toList();
    
    return bbEpisodesList;
  }

// for http response
//Future<List<CharacterModel>> getAllCharacters() => _characterProvider.getCharacters();
}
