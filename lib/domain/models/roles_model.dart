class RolesModel {
  int? episodeCount;
  String? character;
  String? creditId;
 

  RolesModel({
    this.episodeCount,
    this.character,
    this.creditId,
  
  });

  RolesModel.fromJson(Map<String, dynamic> json) {
    episodeCount = json['episode_count'];
    character = json['character'];
    creditId = json['credit_id'];
  
  }
}
