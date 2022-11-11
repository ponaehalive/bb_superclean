// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:superclean/domain/services/end_points.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future<String?> auth({
    required String userName,
    required String password,
  }) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
      username: userName,
      password: password,
      requestToken: token,
    );
    if (validToken != null) {
      final sessionId = await _makeSession(requestToken: validToken);

      return sessionId;
    }
    return null;
  }

  Future<String?> _makeToken() async {
    try {
      Response response = await dio.get(TMDBEndPoints.makeToken);

      final token = response.data['request_token'];

      return token;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> _validateUser({
    required String username,
    required String password,
    required String? requestToken,
  }) async {
    try {
      if (requestToken != null) {
        Response response = await dio.post(
          TMDBEndPoints.validateToken,
          data: <String, String>{
            'username': username,
            'password': password,
            "request_token": requestToken,
          },
        );

        return response.data['request_token'];
      }
    } on DioError catch (e) {
      final errorMessage = e.response?.data['status_message'];
      final statusMessage = e.response?.statusMessage;

      Fluttertoast.showToast(
          msg: '$errorMessage \n $statusMessage',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return null;
  }

  Future<String?> _makeSession({required String requestToken}) async {
    try {
      Response response = await dio.post(
        TMDBEndPoints.makeSession,
        data: <String, String>{
          "request_token": requestToken,
        },
      );

      return response.data['session_id'];
    } catch (e) {
      print(e);
    }
    return null;
  }
}
