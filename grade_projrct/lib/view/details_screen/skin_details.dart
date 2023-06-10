import 'package:flutter/material.dart';

import 'package:grade_projrct/constant/const.dart';
import '../../models/skin_model.dart';

class SkinDetailScreen extends StatelessWidget {
  final SkinModel model;
  const SkinDetailScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: mainColor.withOpacity(0.0),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Image.network(
                  '${model.effictiveSkin}',
                  height: hight / 3,
                  width: width / 2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: hight / 40,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('اسم الدواء',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: hight / 35)),
              ),
              Text('${model.diseaseName}',
                  style: TextStyle(fontSize: hight / 40)),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('النشره الطبيه',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: hight / 35)),
              ),
              Text('${model.treatmentSkins}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: hight / 40)),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('الاعراض الجانبيه',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: hight / 35)),
              ),
              Text('${model.symptomsDiseaseSkin}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: hight / 40)),
            ],
          ),
        ),
      ),
    );
  }
}
