import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superclean/domain/bloc/actors/actors_event.dart';
import 'package:superclean/domain/bloc/actors/actors_state.dart';
import 'package:superclean/domain/models/character_model.dart';
import 'package:superclean/domain/services/characters_repository.dart';
import 'package:superclean/domain/services/secure_auth_data.dart';

class ActorsBloc extends Bloc<ActorsEvent, ActorsState> {
  final _secureAuthData = SecureAuthData();

  final ActorRepository actorRepository = ActorRepository();
  ActorsBloc() : super(ActorsState.initial) {
    on<ActorsLoadEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoadind: true,
          ),
        );

        {
          final List<ActorModel> loadedActorsList =
              await actorRepository.getAllActors();

          // ignore: unused_local_variable
          final sessionId = await _secureAuthData.getSessionId();
         

          emit(
            state.copyWith(
              loadedActors: loadedActorsList,
              isLoadind: false,
            ),
          );
        }
      },
    );
    on<ActorSelectEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            selectedActor: event.selectedActor,
          ),
        );
      },
    );
  }
}
