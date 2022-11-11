abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String? userName;
  final String? password;
  
    LoginEvent({
    required this.userName,
    required this.password,
  });
}
