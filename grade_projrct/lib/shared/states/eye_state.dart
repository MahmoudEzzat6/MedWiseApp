abstract class EyesStates {}

class EyesInitialStates extends EyesStates {}

class EyesSuccessStates extends EyesStates {}

class EyesLoadingStates extends EyesStates {}

class EyesErrorStates extends EyesStates {
  final String error;

  EyesErrorStates(this.error);
}

class EyesIconsStates extends EyesStates {}

class EyesDropMenusStates extends EyesStates {}
