import 'dart:convert';
import 'package:flutter/foundation.dart';

class EarsModel {
  String? diseaseName;
  String? id;
  String? symptomsDiseaseEar;
  String? treatmentEars;
  String? effictiveEar;
  String? image;

  EarsModel({
    required this.id,
    required this.image,
    required this.diseaseName,
    required this.symptomsDiseaseEar,
    required this.effictiveEar,
    required this.treatmentEars,
  });

  EarsModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['earsimage'];
    diseaseName = json['disease_name_ears'];
    symptomsDiseaseEar = json['Symptoms_disease_ears'];
    treatmentEars = json['treatment_ears'];
    effictiveEar = json['Effective_Material_ears'];
  }
  Map<String, dynamic> tojson() {
    return {
      '_id': id,
      'earsimage': image,
      'disease_name_ears': diseaseName,
      'Symptoms_disease_ears': symptomsDiseaseEar,
      'treatment_ears': treatmentEars,
      'Effective_Material_ears': effictiveEar,
    };
  }
}
