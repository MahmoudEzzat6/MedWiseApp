import 'dart:convert';
import 'package:flutter/foundation.dart';

class EyesModel {
  String? diseaseName;
  String? id;
  String? symptomsDiseaseEyes;
  String? treatmentEyes;
  String? effictiveEyes;
  String? image;

  EyesModel({
    required this.id,
    required this.image,
    required this.diseaseName,
    required this.symptomsDiseaseEyes,
    required this.effictiveEyes,
    required this.treatmentEyes,
  });

  EyesModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['eyesimage'];
    diseaseName = json['disease_name_eyes'];
    symptomsDiseaseEyes = json['Symptoms_disease_eyes'];
    treatmentEyes = json['treatment_eyes'];
    effictiveEyes = json['Effective_Material_eyes'];
  }
  Map<String, dynamic> tojson() {
    return {
      '_id': id,
      'eyesimage': image,
      'disease_name_eyes': diseaseName,
      'Symptoms_disease_eyes': symptomsDiseaseEyes,
      'treatment_eyes': treatmentEyes,
      'Effective_Material_eyes': effictiveEyes,
    };
  }
}
