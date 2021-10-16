abstract class LoginStates {}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{}
class LoginFailState extends LoginStates{
  final String error;
  LoginFailState(this.error);
}