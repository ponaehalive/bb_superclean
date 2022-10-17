class CharacterModel{
  int? charId;
  String? name;
  String? birthDay;
  String? image;
  String? status;
  String? nakeName;
  String? actorName;
  String? category;

  CharacterModel.fromJson(Map<String,dynamic> json){
    charId=json['char_id'];
    name=json['name'];
    birthDay=json['birthday'];
    image=json['img'];
    status=json['status'];
    nakeName=json['nickname'];
    actorName=json['portrayed'];
    category=json['category'];

  }
}



