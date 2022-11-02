import 'package:superclean/domain/services/auth_api_provider.dart';
import 'package:superclean/domain/services/session_data_provider.dart';

class AuthService {
  final _sessionDataProvider = SessionDataProvider();
  final _authApiProvider = AuthApiProvider();

  Future<bool> checkAuth() async {
    final apiKey = await _sessionDataProvider.apiKey();
    return apiKey != null;
  }

  Future<void> newLogin(String userName, String password) async {
    final sessionId = await _authApiProvider.auth(
      userName: userName,
      password: password,
    );
    print('super-pupper session id: $sessionId');
    await _sessionDataProvider.saveApiKey(sessionId);
  }

  Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  }
}
