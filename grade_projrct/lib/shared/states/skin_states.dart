abstract class SkinStates {}

class SkinInitialStates extends SkinStates {}

class SkinSuccessStates extends SkinStates {}

class SkinLoadingStates extends SkinStates {}

class SkinErrorStates extends SkinStates {
  final String error;

  SkinErrorStates(this.error);
}

class SkinIconsStates extends SkinStates {}

class SkinDropMenusStates extends SkinStates {}
