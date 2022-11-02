import 'package:superclean/domain/services/auth_api_provider.dart';

class AuthService {
  final _authApiProvider = AuthApiProvider();

/*   Future<bool> checkAuth() async {
    final apiKey = await _sessionDataProvider.apiKey();
    return apiKey != null;
  }
 */
  Future<String?> login(String userName, String password) async {
    final sessionId = await _authApiProvider.auth(
      userName: userName,
      password: password,
    );
    // ignore: avoid_print
    print('super-pupper session id: $sessionId');
       return sessionId;
  }

/*   Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  } */
}
