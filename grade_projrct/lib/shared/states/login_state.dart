abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginErrorStates extends LoginStates {
  final String error;

  LoginErrorStates(this.error);
}

class LoginSuffixIconsStates extends LoginStates {}

class LoginDropMenusStates extends LoginStates {}
