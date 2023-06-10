abstract class KidneysStates {}

class KidneysInitialStates extends KidneysStates {}

class KidneysSuccessStates extends KidneysStates {}

class KidneysLoadingStates extends KidneysStates {}

class KidneysErrorStates extends KidneysStates {
  final String error;

  KidneysErrorStates(this.error);
}

class KidneysIconsStates extends KidneysStates {}
