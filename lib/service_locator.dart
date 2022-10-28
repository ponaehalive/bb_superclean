import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/bloc/episodes/episodes_bloc.dart';

class ServiceLocator {
  static final instace = ServiceLocator._();
  ServiceLocator._();

  final AppRouter router = AppRouter();

  final CharactersBloc charactersBloc = CharactersBloc();

  final EpisodesBloc episodesBloc = EpisodesBloc();


}
