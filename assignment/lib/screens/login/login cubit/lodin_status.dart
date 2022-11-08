import '../../../model/logins.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginSuccess extends LoginStates {
  LoginModel loginmodel;
  LoginSuccess(this.loginmodel);
}

class Loginloding extends LoginStates {}

class LoginError extends LoginStates {
  String error;
  LoginError(this.error);
}
