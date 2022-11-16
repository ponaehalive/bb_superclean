// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:superclean/domain/services/end_points.dart';

class Provider {
  late Dio dio;

  Provider() {
    BaseOptions options = BaseOptions(
      //baseUrl: BBEndPoints.baseUrl,
      baseUrl: TMDBEndPoints.baseTMDBUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, //60 seconds
      receiveTimeout: 60 * 1000,
      sendTimeout: 10000,
    );
    dio = Dio(options);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
  }

//dio response
  Future<List<dynamic>> getCharacters() async {
    try {
      //Response response = await dio.get(BBEndPoints.allCharacters);
      Response response = await dio.get(TMDBEndPoints.characters);
      return response.data['cast'];
    } catch (e) {
      print("some Error $e");
      return [];
    }
  }

  Future<List<dynamic>> getAllBBEpisodes() async {
    try {
      Response response = await dio.get(BBEndPoints.allBBEpisodes);

      return response.data;
    } catch (e) {
      print("some Error $e");
      return [];
    }
  }

/*http response
   Future<List<CharacterModel>> getCharactersHttp() async {
    final response = await http.get(
      Uri.parse(
        'https://www.breakingbadapi.com/api/characters',
      ),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);

      final List<dynamic> charactersJson = json.decode(response.body);
      return charactersJson
          .map((json) => CharacterModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error');
    }
  } 
  */

}
