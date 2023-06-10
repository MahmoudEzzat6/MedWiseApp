abstract class HeadacheStates {}

class HeadacheInitialStates extends HeadacheStates {}

class HeadacheSuccessStates extends HeadacheStates {}

class HeadacheLoadingStates extends HeadacheStates {}

class HeadacheErrorStates extends HeadacheStates {
  final String error;

  HeadacheErrorStates(this.error);
}

class HeadacheIconsStates extends HeadacheStates {}
