import 'dart:convert';
import 'package:flutter/foundation.dart';

class KidneysModel {
  String? diseaseName;
  String? id;
  String? symptomsDiseaseKidneys;
  String? treatmentKidneyss;
  String? effictiveKidneys;
  String? image;

  KidneysModel({
    required this.id,
    required this.diseaseName,
    required this.symptomsDiseaseKidneys,
    required this.effictiveKidneys,
    required this.treatmentKidneyss,
  });

  KidneysModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];

    diseaseName = json['disease_name_kidney'];
    symptomsDiseaseKidneys = json['Symptoms_disease_kidney'];
    treatmentKidneyss = json['treatment_kidney'];
    effictiveKidneys = json['Effective_Material_kidney'];
  }
  Map<String, dynamic> tojson() {
    return {
      '_id': id,
      'disease_name_kidney': diseaseName,
      'Symptoms_disease_kidney': symptomsDiseaseKidneys,
      'treatment_kidney': treatmentKidneyss,
      'Effective_Material_kidney': effictiveKidneys,
    };
  }
}
