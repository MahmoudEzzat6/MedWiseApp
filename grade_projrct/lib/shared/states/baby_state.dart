abstract class BabyStates {}

class BabyInitialStates extends BabyStates {}

class BabySuccessStates extends BabyStates {}

class BabyLoadingStates extends BabyStates {}

class BabyErrorStates extends BabyStates {
  final String error;

  BabyErrorStates(this.error);
}

class BabyIconsStates extends BabyStates {}

class BabyDropMenusStates extends BabyStates {}
