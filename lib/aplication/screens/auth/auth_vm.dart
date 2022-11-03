import 'package:flutter/cupertino.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/services/auth_service.dart';
import 'package:superclean/domain/services/session_data_provider.dart';
import 'package:superclean/service_locator.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';

class AuthViewModel extends ChangeNotifier with BaseViewModel {
  final _appRouter = ServiceLocator.instace.router;
  String login = '';
  String password = '';
  String authErrorTittle = '';
  bool canSubmit = false;
  final _authService = AuthService();
  final _sessionDataProvider = SessionDataProvider();
  bool isAuthorized = false;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goHome() {
    _appRouter.push(const AutoTabsScaffoldRoute());
  }

  void init() {
    // ignore: avoid_print
    print('init auth page');
  }

  void changeLogin(String value) {
    login = loginController.text;
    checkFields();
    notifyListeners();
  }

  void changePassword(String value) {
    password = passwordController.text;
    checkFields();
    notifyListeners();
  }

  void checkFields() {
    if (login.isNotEmpty && password.isNotEmpty) {
      canSubmit = true;
      notifyListeners();
    } else if (login.isEmpty || password.isEmpty) {
      canSubmit = false;
      notifyListeners();
    }
  }

  Future<void> onAuthButtonPress() async {
    if (login.isEmpty || password.isEmpty) {
      authErrorTittle = 'Заполните логин и пароль';

      notifyListeners();
      return;
    }
    authErrorTittle = '';
    notifyListeners();
    String? sessionId;
    {
      sessionId = await _authService.login(
        login,
        password,
      );

      if (sessionId == null) {
        return;
      }
      await _sessionDataProvider.setSessionId(sessionId);
      goHome();
    }
  }
}
