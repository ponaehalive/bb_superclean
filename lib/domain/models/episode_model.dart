class EpisodeModel {
  int? episodeId;
  int? episodeNumber; 
  String? airDate;
  String? name;

  EpisodeModel({
    this.episodeId,
    this.episodeNumber, 
    this.airDate,
    this.name,
  });

  EpisodeModel.fromJson(Map<String, dynamic> json) {
    episodeId = json['id'];
    episodeNumber = json['episode_number']; 
    airDate = json['air_date'];
    name = json['name'];
  }
}
