abstract class HairStates {}

class HairInitialStates extends HairStates {}

class HairSuccessStates extends HairStates {}

class HairLoadingStates extends HairStates {}

class HairErrorStates extends HairStates {
  final String error;

  HairErrorStates(this.error);
}

class HairIconsStates extends HairStates {}
