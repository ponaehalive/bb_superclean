import 'package:get_it/get_it.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/auth/auth_bloc.dart';
import 'package:superclean/domain/bloc/characters/characters_bloc.dart';
import 'package:superclean/domain/bloc/episodes/episodes_bloc.dart';

void setupGetIt() {
  GetIt.instance.registerSingleton<AppRouter>(AppRouter());
  GetIt.instance.registerSingleton<CharactersBloc>(CharactersBloc());
  GetIt.instance.registerSingleton<EpisodesBloc>(EpisodesBloc());
  GetIt.instance.registerSingleton<AuthBloc>(AuthBloc());
}

class ServiceLocator {
  /* static final instace = ServiceLocator._();
  ServiceLocator._();

  final CharactersBloc charactersBloc = CharactersBloc();

  final EpisodesBloc episodesBloc = EpisodesBloc();

  final AuthBloc authBloc = AuthBloc();

  final AppRouter router = AppRouter(); */
}
/* 

 final CharactersBloc charactersBloc = CharactersBloc();

  final EpisodesBloc episodesBloc = EpisodesBloc();

  final AuthBloc authBloc = AuthBloc();
 */