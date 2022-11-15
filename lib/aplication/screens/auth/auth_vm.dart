// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/auth/auth_bloc.dart';
import 'package:superclean/domain/bloc/auth/auth_event.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';

class AuthViewModel extends ChangeNotifier with BaseViewModel {
  final _authBloc = GetIt.instance<AuthBloc>();
  final _appRouter = GetIt.instance<AppRouter>();

  String login = '';
  String password = '';

  bool canSubmit = false;

  bool isAuthorized = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get googleCurrentUser => _firebaseAuth.currentUser;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  StreamSubscription? _authBlocSubscription;

  AuthViewModel() {
    _authBlocSubscription = _authBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    super.dispose();
    _authBlocSubscription?.cancel();
  }

  void init() {
    print('init auth page');
  }

  void goHome() {
    _appRouter.push(const AutoTabsScaffoldRoute());
  }

  

  // TODO: refactor google login/logout to bloc

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

   Future<void> googleLogOut() async {
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

  Future<void> tryLogin() async {
    _authBloc.add(
      LoginEvent(
        userName: login,
        password: password,
      ),
    );
  }


  

  void setLocale(context) {
    if (EasyLocalization.of(context)?.locale.countryCode == 'RU') {
      EasyLocalization.of(context)?.setLocale(
        const Locale('en', 'US'),
      );
    } else {
      EasyLocalization.of(context)?.setLocale(
        const Locale('ru', 'RU'),
      );
    }
  }

  String get sesid => _authBloc.state.sessionId;
}
