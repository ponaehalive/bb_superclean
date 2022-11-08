// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goHome() {
    _appRouter.push(const AutoTabsScaffoldRoute());
  }

  void init() {
    // ignore: avoid_print
    print('init auth page');
  }

  Future<void> googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            ),
          );
        } on FirebaseException catch (e) {
          print(e);
        } catch (error) {
          print(error);
        } finally {}
      }
    }
     notifyListeners();
  }

  void bobob() {
    print(currentUser?.email);
  }

  Future<void> logOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
     notifyListeners();
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
    DatabaseReference loginDB = FirebaseDatabase.instance.ref().child('login');
    loginDB.set(login);
    DatabaseReference passwordDB =
        FirebaseDatabase.instance.ref().child('password');
    passwordDB.set(password);

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
