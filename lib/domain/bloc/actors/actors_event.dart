import 'package:superclean/domain/models/character_model.dart';

abstract class ActorsEvent {}

class ActorsLoadEvent extends ActorsEvent {}

class ActorSelectEvent extends ActorsEvent {
  final ActorModel selectedActor;
  ActorSelectEvent({
    required this.selectedActor,
  });
}
