import 'package:get_it/get_it.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/auth/auth_bloc.dart';
import 'package:superclean/domain/bloc/actors/actors_bloc.dart';
import 'package:superclean/domain/bloc/episodes/episodes_bloc.dart';

void setupGetIt() {
  GetIt.instance.registerSingleton<AppRouter>(AppRouter());
  GetIt.instance.registerSingleton<ActorsBloc>(ActorsBloc());
  GetIt.instance.registerSingleton<EpisodesBloc>(EpisodesBloc());
  GetIt.instance.registerSingleton<AuthBloc>(AuthBloc());
}
