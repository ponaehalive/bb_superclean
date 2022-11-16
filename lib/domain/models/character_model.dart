import 'package:superclean/domain/models/roles_model.dart';

class ActorModel {
/*   int? charId;
  String? name;
  String? birthDay;
  String? image;
  String? status;
  String? nakeName;
  String? actorName;
  String? category; */
  String? actorName;
  String? profilePath;
  List<RolesModel>? roles;

  ActorModel({
/*     this.charId,
    this.name,
    this.birthDay,
    this.image,
    this.status,
    this.nakeName,
    this.actorName,
    this.category, */
    this.actorName,
    this.profilePath,
    this.roles,
  });

  ActorModel.fromJson(Map<String, dynamic> json) {
    /*    charId = json['char_id'];
    name = json['name'];
    birthDay = json['birthday'];
    image = json['img'];
    status = json['status'];
    nakeName = json['nickname'];
    actorName = json['portrayed'];
    category = json['category']; */
    actorName = json['name'];
    profilePath = json['profile_path'];

    roles = List<dynamic>.from(json['roles'])
        .map((i) => RolesModel.fromJson(i))
        .toList();
  }
}
