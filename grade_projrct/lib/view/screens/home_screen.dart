import 'package:flutter/material.dart';

import 'package:grade_projrct/constant/const.dart';
import 'package:grade_projrct/shared/components.dart';

import 'package:grade_projrct/view/screens/baby_screen.dart';
import 'package:grade_projrct/view/screens/ear_screen.dart';
import 'package:grade_projrct/view/screens/eye_screen.dart';
import 'package:grade_projrct/view/screens/hair_screen.dart';
import 'package:grade_projrct/view/screens/headache_screen.dart';
import 'package:grade_projrct/view/screens/kidneys_screen.dart';
import 'package:grade_projrct/view/screens/lungs_screen.dart';
import 'package:grade_projrct/view/screens/skin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('MedWise', style: TextStyle(color: Colors.white)),
          elevation: 0.0,
          backgroundColor: mainColor,
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
              height: hight,
              width: width,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: (() {
                            navigateTo(context, const EyeScreen());
                          }),
                          child: Container(
                            height: hight / 6,
                            width: width / 2.2,
                            child: Row(
                              children: [
                                Image.asset('assets/images/eyeimg.png',
                                    height: hight / 9.2),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text('العيون',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: (() {
                            navigateTo(context, Earscreen());
                          }),
                          child: Container(
                            height: hight / 6.5,
                            width: width / 2.2,
                            child: Row(
                              children: [
                                Image.asset('assets/images/ear.png',
                                    height: hight / 7.2),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text('الاذن',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: (() {
                            navigateTo(context, const Babyscreen());
                          }),
                          child: Container(
                            height: hight / 6,
                            width: width / 2.2,
                            child: Row(
                              children: [
                                Image.asset('assets/images/babyyy.png',
                                    height: hight / 9.2),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('الاطفال',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: (() {
                            navigateTo(context, const Skinscreen());
                          }),
                          child: Container(
                            height: hight / 5.5,
                            width: width / 2.2,
                            child: Row(
                              children: [
                                Image.asset('assets/images/geld.png',
                                    height: hight / 7.2),
                                const Text('جلديه',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: (() {
                            navigateTo(context, const Headachescreen());
                          }),
                          child: Container(
                            height: hight / 6,
                            width: width / 2.2,
                            child: Row(
                              children: [
                                Image.asset('assets/images/head.png',
                                    height: hight / 9.6),
                                const Text('الصداع',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: (() {
                            navigateTo(context, const Lungscreen());
                          }),
                          child: Container(
                            height: hight / 5.5,
                            width: width / 2.2,
                            child: Row(
                              children: [
                                Image.asset('assets/images/tnfs.png',
                                    height: hight / 8.2),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text('التنفس',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: (() {
                            navigateTo(context, const Hairscreen());
                          }),
                          child: Container(
                            height: hight / 6,
                            width: width / 2.2,
                            child: Row(
                              children: [
                                Image.asset('assets/images/hairr.png',
                                    fit: BoxFit.cover, height: hight / 7.2),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('الشعر',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: (() {
                            navigateTo(context, const Kidneysscreen());
                          }),
                          child: Container(
                            height: hight / 5.5,
                            width: width / 2.2,
                            child: Row(
                              children: [
                                Image.asset('assets/images/klya.png',
                                    height: hight / 7.2),
                                SizedBox(
                                  width: 5,
                                ),
                                const Text('الكلي',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: hight / 100),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 8,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      confirmData(context);
                    },
                    child: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ));
  }
}
