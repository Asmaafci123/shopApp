import '../login_model.dart';

abstract class LoginStates {}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginFailState extends LoginStates{
  final String error;
  LoginFailState(this.error);
}