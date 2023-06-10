import 'dart:convert';
import 'package:flutter/foundation.dart';

class BabyModel {
  String? diseaseName;
  String? id;
  String? images;
  String? symptomsDiseaseBaby;
  String? treatmentbabys;
  String? effictiveBaby;

  BabyModel({
    required this.id,
    required this.images,
    required this.diseaseName,
    required this.symptomsDiseaseBaby,
    required this.effictiveBaby,
    required this.treatmentbabys,
  });

  BabyModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    images = json['babyimage'];
    diseaseName = json['disease_name_baby'];
    symptomsDiseaseBaby = json['Symptoms_disease_baby'];
    treatmentbabys = json['treatment_baby'];
    effictiveBaby = json['Effective_Material_baby'];
  }
  Map<String, dynamic> tojson() {
    return {
      '_id': id,
      'babyimage': images,
      'disease_name_baby': diseaseName,
      'Symptoms_disease_baby': symptomsDiseaseBaby,
      'treatment_baby': treatmentbabys,
      'Effective_Material_baby': effictiveBaby,
    };
  }
}
