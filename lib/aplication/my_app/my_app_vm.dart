import 'package:superclean/domain/services/auth_service.dart';

class MyAppViewModel {
  final _authService = CheckAuthService();
  bool _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionAuth = await _authService.checkAuth();
    _isAuth = sessionAuth;
  }
}
