import 'package:flutter/material.dart';
import 'package:grade_projrct/shared/cubit/bloc_observer.dart';
import 'package:grade_projrct/shared/cubit/home_cubit/eyes_cubit.dart';
import 'package:grade_projrct/shared/cubit/home_cubit/baby_cubit.dart';
import 'package:grade_projrct/shared/cubit/home_cubit/ears_cubit.dart';
import 'package:grade_projrct/shared/cubit/home_cubit/hair_cubit.dart';
import 'package:grade_projrct/shared/cubit/home_cubit/headache_cubit.dart';
import 'package:grade_projrct/shared/cubit/home_cubit/kidneys_cubit.dart';
import 'package:grade_projrct/shared/cubit/home_cubit/lungs_cubit.dart';
import 'package:grade_projrct/shared/cubit/home_cubit/skin_cubit.dart';
import 'package:grade_projrct/shared/cubit/regester_cubit/regester_cubit.dart';
import 'package:grade_projrct/shared/local/shared_pref.dart';
import 'package:grade_projrct/view/auth_screens/login_screen.dart';
import 'package:grade_projrct/view/screens/home_screen.dart';
import 'package:grade_projrct/view/welcome_screen/on_boarding_screen.dart';
import 'package:grade_projrct/view/welcome_screen/splash_screen.dart';
import 'constant/theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Widget homeScreen = SplashScreen();
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();

  runApp(MyApp(HomeScreen: homeScreen));
}

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const MyApp({Key? key, required this.HomeScreen}) : super(key: key);
  // ignore: non_constant_identifier_names
  final Widget HomeScreen;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => EyesCubit()..fetchPosts()),
        BlocProvider(create: (context) => EarsCubit()..fetchEars()),
        BlocProvider(create: (context) => BabyCubit()..fetchBaby()),
        BlocProvider(create: (context) => SkinCubit()..fetchSkin()),
        BlocProvider(create: (context) => HeadacheCubit()..fetchHeadache()),
        BlocProvider(create: (context) => HairCubit()..fetchHair()),
        BlocProvider(create: (context) => KidneysCubit()..fetchKidneys()),
        BlocProvider(create: (context) => LungsCubit()..fetchLungs()),
      ],
      child: MaterialApp(
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: [
          const Locale('ar', 'EG'), // arabic
        ],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemesApp.light,
        home: homeScreen,
      ),
    );
  }
}
