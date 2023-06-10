abstract class EarsStates {}

class EarsInitialStates extends EarsStates {}

class EarsSuccessStates extends EarsStates {}

class EarsLoadingStates extends EarsStates {}

class EarsErrorStates extends EarsStates {
  final String error;

  EarsErrorStates(this.error);
}

class EarsIconsStates extends EarsStates {}

class EarsDropMenusStates extends EarsStates {}
