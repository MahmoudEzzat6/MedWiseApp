import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/constant/const.dart';
import 'package:grade_projrct/shared/components.dart';
import 'package:grade_projrct/shared/cubit/regester_cubit/regester_cubit.dart';
import 'package:grade_projrct/shared/states/login_state.dart';
import 'package:grade_projrct/shared/states/regester_states.dart';
import 'package:grade_projrct/view/auth_screens/sign_up_screen.dart';
import 'package:grade_projrct/view/screens/home_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rive/rive.dart';

import '../../constant/animation_enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerLookLeft;
  late RiveAnimationController controllerLookRight;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  final passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;
  bool is_show = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerLookLeft);
    riveArtboard?.artboard.removeController(controllerLookRight);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint("idleee");
  }

  void addHandsUpController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsUp);
    debugPrint("hands up");
  }

  void addHandsDownController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsDown);
    debugPrint("hands down");
  }

  void addSuccessController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSuccess);
  }

  void addFailController() {
    final snackBar = SnackBar(
      content: Text('فشل تسجيل الدخول تأكد من البيانات المدخله !',
          style: TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: (Colors.red),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerFail);
    debugPrint("Faillll");
  }

  void addLookRightController() {
    removeAllControllers();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLookRight);
    debugPrint("Righttt");
  }

  void addLookLeftController() {
    removeAllControllers();
    isLookingLeft = true;
    riveArtboard?.artboard.addController(controllerLookLeft);
    debugPrint("Leftttttt");
  }

  void checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        addHandsDownController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerLookRight = SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);

    rootBundle.load('assets/animated_login_screen.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });

    checkForPasswordFocusNodeToChangeAnimationState();
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, Object? state) {
        if (state is RegisterSuccessStates) {
          navigateAndFinish(context, const HomeScreen());
        } else if (state is RegisterErrorStates) {
          addFailController();
        }
      },
      builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor.withOpacity(0.4),
            elevation: 0.01,
            title: Row(
              children: [
                SizedBox(
                  width: width / 30,
                ),
                const Text('تسجيل ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                Text('الدخول',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          backgroundColor: mainColor.withOpacity(0.7),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: hight / 0.9),
                  Container(
                    height: hight / 1.3,
                    width: width / 1.1,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white.withOpacity(0.9),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18))),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(hight / 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: hight / 3.5,
                      child: riveArtboard == null
                          ? const SizedBox.shrink()
                          : Rive(
                              artboard: riveArtboard!,
                            ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "البريد الالكتروني",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: mainColor)),
                            ),
                            validator: (value) {
                              if (!RegExp(validationEmail).hasMatch(value!) ||
                                  value.toString().isEmpty) {
                                return 'البريد الالكتروني غير صحيح';
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty &&
                                  value.length > 16 &&
                                  !isLookingLeft) {
                                addLookLeftController();
                              } else if (value.isNotEmpty &&
                                  value.length < 16 &&
                                  !isLookingRight) {
                                addLookRightController();
                              }
                            },
                          ),
                          SizedBox(
                            height: hight / 35,
                          ),
                          TextFormField(
                            obscureText: is_show ? false : true,
                            controller: passwordController,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        is_show = !is_show;
                                      });
                                    },
                                    child: is_show
                                        ? Icon(
                                            Icons.visibility,
                                            color: mainColor.withOpacity(0.7),
                                          )
                                        : Icon(
                                            Icons.visibility_off_outlined,
                                            color: mainColor.withOpacity(0.7),
                                          )),
                                labelText: "كلمه المرور",
                                //labelStyle: TextStyle(color: mainColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: mainColor))),
                            focusNode: passwordFocusNode,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'لا يمكنك ترك الخانه فارغه';
                              }
                            },
                          ),
                          SizedBox(
                            height: hight / 40,
                          ),
                          state is RegisterLoadingStates
                              ? LoadingAnimationWidget.beat(
                                  color: Colors.blue,
                                  size: hight / 15,
                                )
                              : Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width / 8,
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: mainColor,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                    ),
                                    onPressed: () {
                                      passwordFocusNode.unfocus();
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        if (formKey.currentState!.validate()) {
                                          addSuccessController();
                                          RegisterCubit.get(context).signIn(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        } else {
                                          addFailController();
                                        }
                                      });
                                    },
                                    child: const Text(
                                      'دخول',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('ليس لديك حساب؟',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black)),
                              const SizedBox(
                                width: 2.0,
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateAndFinish(context, SignUpScreen());
                                },
                                child: Text(
                                  'سجل هنا',
                                  style: TextStyle(color: mainColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
