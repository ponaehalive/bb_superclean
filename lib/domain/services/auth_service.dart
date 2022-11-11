import 'package:superclean/domain/services/session_data_provider.dart';

class AuthService {
  final _sessionDataProvider = SessionDataProvider();
  


  Future<bool> checkAuth() async {
    bool isAuth = false;
    final sessionId = await _sessionDataProvider.getSessionId();
    isAuth = sessionId != null && sessionId !='';
    return isAuth;
  }

}
