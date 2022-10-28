class EpisodeModel{


  int? episodeId;
 String? title;
  String? season;
  String? episodeNumber;
  String? airDate;
  List<dynamic>? characters;


   EpisodeModel({
    this.episodeId,
    this.title,
    this.season,
    this.episodeNumber,
    this.airDate,
    this.characters,
  


  });

  EpisodeModel.fromJson(Map<String,dynamic> json){
    episodeId=json['episode_id'];
    title=json['title'];
    season=json['season'];
    episodeNumber=json['episode'];
    airDate=json['air_date'];
    characters=json['characters'];
   

  }
}


