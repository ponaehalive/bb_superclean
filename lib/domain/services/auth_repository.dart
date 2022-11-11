// ignore_for_file: avoid_print

import 'package:superclean/domain/services/auth_api_provider.dart';

class AuthRepository {
  final AuthApiProvider _authApiProvider = AuthApiProvider();

  Future<String?> getSessionId({
    required String userName,
    required String password,
  }) async {
    final sessionId = await _authApiProvider.auth(
      userName: userName,
      password: password,
    );

    return sessionId;
  }

// for http response
//Future<List<CharacterModel>> getAllCharacters() => _characterProvider.getCharacters();
}
