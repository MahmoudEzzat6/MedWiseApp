import 'package:flutter/material.dart';
import 'package:grade_projrct/shared/components.dart';
import 'package:grade_projrct/shared/local/shared_pref.dart';
import 'package:grade_projrct/view/auth_screens/login_screen.dart';
import 'package:grade_projrct/view/welcome_screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var onBoarding = CashHelper.getData(key: 'Boarding');

  @override
  void initState() {
    if (onBoarding != null) {
      onBoarding = true;
    } else {
      onBoarding = false;
    }
    Future.delayed(const Duration(milliseconds: 4900), () {
      navigateAndFinish(
          context, onBoarding ? const LoginScreen() : OnBoardingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/MedWise.gif',
                width: width / 1, height: hight / 1),
          ],
        ),
      ),
    );
  }
}
