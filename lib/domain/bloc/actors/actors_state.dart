import 'package:superclean/domain/models/character_model.dart';

class ActorsState {
  List<ActorModel>? loadedActors;
  bool? isLoadind;
  ActorModel? selectedActor;

  ActorsState({
    this.loadedActors,
    this.isLoadind,
    required this.selectedActor,
  });

  ActorsState copyWith({
    List<ActorModel>? loadedActors,
    bool? isLoadind,
    ActorModel? selectedActor,
  }) =>
      ActorsState(
          loadedActors: loadedActors ?? this.loadedActors,
          isLoadind: isLoadind ?? this.isLoadind,
          selectedActor: selectedActor ?? this.selectedActor);

  static ActorsState get initial {
    return ActorsState(
      loadedActors: [],
      isLoadind: false,
      selectedActor: ActorModel(),
    );
  }
}
