import 'package:superclean/domain/services/auth_api_provider.dart';
import 'package:superclean/domain/services/session_data_provider.dart';

class AuthService {
  final _authApiProvider = AuthApiProvider();
  final _sessionDataProvider = SessionDataProvider();
  


  Future<bool> checkAuth() async {
    bool isAuth = false;
    final sessionId = await _sessionDataProvider.getSessionId();
    isAuth = sessionId != null && sessionId !='';
    return isAuth;
  }

  Future<String?> login(String userName, String password) async {
    final sessionId = await _authApiProvider.auth(
      userName: userName,
      password: password,
    );

    return sessionId;
  }

/*   Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  } */
}
