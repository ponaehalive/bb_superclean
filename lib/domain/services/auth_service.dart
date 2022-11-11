import 'package:superclean/domain/services/secure_auth_data.dart';

class CheckAuthService {
  
  final _secureAuthData = SecureAuthData();

  Future<bool> checkAuth() async {
    bool isAuth = false;
    final sessionId = await _secureAuthData.getSessionId();
    isAuth = sessionId != null && sessionId != '';
    return isAuth;
  }

/*   Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  } */
}
