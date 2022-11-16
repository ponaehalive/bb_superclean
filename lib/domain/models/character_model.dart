class CharacterModel {
/*   int? charId;
  String? name;
  String? birthDay;
  String? image;
  String? status;
  String? nakeName;
  String? actorName;
  String? category; */
  String? character;
  String? profilePath;

  CharacterModel({
/*     this.charId,
    this.name,
    this.birthDay,
    this.image,
    this.status,
    this.nakeName,
    this.actorName,
    this.category, */
    this.character,
    this.profilePath,
  });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    /*    charId = json['char_id'];
    name = json['name'];
    birthDay = json['birthday'];
    image = json['img'];
    status = json['status'];
    nakeName = json['nickname'];
    actorName = json['portrayed'];
    category = json['category']; */
    character = json['name'];
    profilePath = json['profile_path'];
  }
}
