import 'dart:convert';
import 'package:flutter/foundation.dart';

class LungsModel {
  String? diseaseName;
  String? id;
  String? image;
  String? symptomsDiseaseLungs;
  String? treatmentLungss;
  String? effictiveLungs;

  LungsModel({
    required this.id,
    required this.diseaseName,
    required this.symptomsDiseaseLungs,
    required this.effictiveLungs,
    required this.treatmentLungss,
    required this.image,
  });

  LungsModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['lungssimage'];
    diseaseName = json['disease_name_lungs'];
    symptomsDiseaseLungs = json['Symptoms_disease_lungs'];
    treatmentLungss = json['treatment_lungs'];
    effictiveLungs = json['Effective_Material_lungs'];
  }
  Map<String, dynamic> tojson() {
    return {
      '_id': id,
      'lungssimage': image,
      'disease_name_lungs': diseaseName,
      'Symptoms_disease_lungs': symptomsDiseaseLungs,
      'treatment_lungs': treatmentLungss,
      'Effective_Material_lungs': effictiveLungs,
    };
  }
}
