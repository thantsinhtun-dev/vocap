sealed class AuthState {}

class AuthInitialState extends AuthState {}
class AuthLoadingState extends AuthState {}
class AuthSuccessState extends AuthState {}
class AuthFailState extends AuthState {
  final String errMsg;
  AuthFailState(this.errMsg);
}