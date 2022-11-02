import 'package:flutter/cupertino.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/services/auth_api_provider.dart';
import 'package:superclean/domain/services/auth_service.dart';
import 'package:superclean/service_locator.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';

class AuthViewModel extends ChangeNotifier with BaseViewModel {
  final _appRouter = ServiceLocator.instace.router;
  String login = '';
  String password = '';
  String authErrorTittle = '';
  bool canSubmit = false;
  final _authService = AuthService();
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
    authErrorTittle = '';
    notifyListeners();
    if (login.isEmpty || password.isEmpty) return;
    {
      try {
        await _authService.newLogin(login, password);
        notifyListeners();
        //goHome();
      } on AuthApiProviderError {
        authErrorTittle = 'not correct login or password';
        notifyListeners();
      } catch (exception) {
        authErrorTittle = 'Ашипка';
        notifyListeners();
      }
    }
  }
}
