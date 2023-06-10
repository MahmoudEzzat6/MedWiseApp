import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grade_projrct/constant/const.dart';
import 'package:grade_projrct/models/eye_model.dart';
import 'package:grade_projrct/models/headache_model.dart';
import 'package:grade_projrct/models/kidneys_model.dart';

import '../../models/breath_model.dart';
import '../../models/skin_model.dart';

class HeadDetailScreen extends StatelessWidget {
  final HeadacheModel model;
  const HeadDetailScreen({Key? key, required this.model}) : super(key: key);

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
                  '${model.effictiveHeadache}',
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
              const Divider(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('النشره الطبيه',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: hight / 35)),
              ),
              Text('${model.treatmentHeadaches}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: hight / 40)),
              const Divider(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('الاعراض الجانبيه',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: hight / 35)),
              ),
              Text('${model.symptomsDiseaseHeadache}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: hight / 40)),
            ],
          ),
        ),
      ),
    );
  }
}
