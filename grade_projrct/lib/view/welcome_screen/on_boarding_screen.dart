import 'package:flutter/material.dart';
import 'package:grade_projrct/constant/const.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/local/shared_pref.dart';
import '../auth_screens/login_screen.dart';

var boardingController = PageController();
var isLast = false;

class BoardingModel {
  final String title;
  final String images;
  final String body;

  BoardingModel(
      {required this.title, required this.images, required this.body});
}

List<BoardingModel> boardingmodel = [
  BoardingModel(
    images: 'assets/images/boarding.jpg',
    title: 'خدماتنا الطبيه ',
    body: 'تسطيع البحث عن الدواء  من داخل التطبيق الخاص بنا من مكانك',
  ),
  BoardingModel(
    images: 'assets/images/boardingsc1.png',
    title: 'الكشف عن المرض ',
    body: 'تسطيع العثور علي الدواء ع عن طريق الاستعلام عن الاعراض ',
  ),
  BoardingModel(
    images: 'assets/images/boarding2.png',
    title: ' الثقه والجوده ',
    body: 'كل البيانات تكون مراجعه من وزاره الصحه المصريه ',
  ),
];

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                submit(context);
              },
              child: const Text(
                'تخطي',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == boardingmodel.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boardingmodel[index]),
                itemCount: boardingmodel.length,
              ),
            ),
            SmoothPageIndicator(
              controller: boardingController,
              count: boardingmodel.length,
              effect: JumpingDotEffect(
                activeDotColor: mainColor,
                dotHeight: 10,
                dotWidth: 10,
                jumpScale: .7,
                verticalOffset: 15,
              ),
            ),
            Row(
              children: [
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    if (isLast) {
                      submit(context);
                    } else {
                      boardingController.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.fastOutSlowIn);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Image(image: AssetImage(model.images)),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        model.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.body,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
  void submit(context) {
    CashHelper.saveData(key: 'Boarding', value: true).then((value) {
      if (value = true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      }
    });
  }
}
