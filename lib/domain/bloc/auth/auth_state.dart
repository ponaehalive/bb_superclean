class AuthState {
  bool isAuth;
  dynamic sessionId;
  String? userName;
  String? password;
  bool? isLoadind;

  AuthState({
    required this.isAuth,
    this.sessionId,
    this.userName,
    this.password,
    this.isLoadind,
  });

  AuthState copyWith({
    required bool isAuth,
    dynamic sessionId,
    String? userName,
    String? password,
    bool? isLoadind,
  }) =>
      AuthState(
        isAuth: isAuth,
        sessionId: sessionId ?? this.sessionId,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        isLoadind: isLoadind ?? this.isLoadind,
      );

  static AuthState get initial {
    return AuthState(
      isAuth: false,
      isLoadind: false,
      sessionId: '',
      userName: '',
      password: '',
    );
  }
}
