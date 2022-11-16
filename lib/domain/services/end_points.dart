class BBEndPoints {
  static const String baseUrl = 'https://www.breakingbadapi.com/api/';
  static const String allCharacters = '/characters';
  static const String characterRandom = '/random';
  static const String quotePath = '/quotes/';
  static const String categoryBreakingBad = '?category=Breaking+Bad';
  static const String categoryBetterCallSaul = '?category=Better+Call+Saul';
  static const String characterName = '?name=';
  static const String allBBEpisodes = 'episodes?series=Breaking+Bad';
}

class TMDBEndPoints {
  static const _apiKey = '65582b30bb06ed4b6267cfd6cb5230a5';
  static const String baseTMDBUrl = 'https://api.themoviedb.org/3/';
  static const String makeToken = 'authentication/token/new?api_key=$_apiKey';
  static const String validateToken =
      'authentication/token/validate_with_login?api_key=$_apiKey';
  static const String makeSession =
      'authentication/session/new?api_key=$_apiKey';

  static const String characters =
      'tv/1396/aggregate_credits?api_key=65582b30bb06ed4b6267cfd6cb5230a5&language=en-US';

  static const String image = 'https://image.tmdb.org/t/p/original';
}
//https://image.tmdb.org/t/p/original/f02FFv77Rh62633YEjimv7C6JM3.jpg




//https://api.themoviedb.org/3/tv/1396/season/1?api_key=65582b30bb06ed4b6267cfd6cb5230a5&language=en-US   //series of season info

//https://api.themoviedb.org/3/tv/1396?api_key=65582b30bb06ed4b6267cfd6cb5230a5&language=en-US  //seasons info


//https://api.themoviedb.org/3/tv/1396/credits?api_key=65582b30bb06ed4b6267cfd6cb5230a5&language=en-US actors

//https://api.themoviedb.org/3/tv/1396/aggregate_credits?api_key=65582b30bb06ed4b6267cfd6cb5230a5&language=en-US   all actors and staff