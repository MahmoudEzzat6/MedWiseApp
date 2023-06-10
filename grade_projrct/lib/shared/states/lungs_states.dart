abstract class LungsStates {}

class LungsInitialStates extends LungsStates {}

class LungsSuccessStates extends LungsStates {}

class LungsLoadingStates extends LungsStates {}

class LungsErrorStates extends LungsStates {
  final String error;

  LungsErrorStates(this.error);
}

class LungsIconsStates extends LungsStates {}
