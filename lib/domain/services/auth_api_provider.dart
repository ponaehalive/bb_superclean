import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:superclean/domain/services/end_points.dart';


abstract class AuthApiProviderError {}

class AuthApiProvider {
  late Dio dio;

  AuthApiProvider() {
    BaseOptions options = BaseOptions(
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

  Future<String> auth({
    required String userName,
    required String password,
  }) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
      username: userName,
      password: password,
      requestToken: token,
    );
    final sessionId = await _makeSession(requestToken: validToken);

    return sessionId;
  }

  Future<String> _makeToken() async {
    try {
      Response response = await dio.get(TMDBEndPoints.makeToken);

      final token = response.data['request_token'];
      return token;
    } catch (e) {
     
      return '';
    }
  }

  Future<String> _validateUser({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    try {
      Response response = await dio.post(
        TMDBEndPoints.validateToken,
        data: <String, String>{
          'username': username,
          'password': password,
          "request_token": requestToken,
        },
      );

      return response.data['request_token'];
    } catch (e) {
     
      return '';
    }
  }

  Future<String> _makeSession({required String requestToken}) async {
    try {
      Response response = await dio.post(
        TMDBEndPoints.makeSession,
        data: <String, String>{
          "request_token": requestToken,
        },
      );

      return response.data['session_id'];
    } catch (e) {
       
      return '';
    }
  }
}
