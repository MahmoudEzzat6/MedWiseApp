import 'dart:convert';
import 'package:flutter/foundation.dart';

class HeadacheModel {
  String? diseaseName;
  String? id;
  String? image;
  String? symptomsDiseaseHeadache;
  String? treatmentHeadaches;
  String? effictiveHeadache;

  HeadacheModel({
    required this.id,
    required this.image,
    required this.diseaseName,
    required this.symptomsDiseaseHeadache,
    required this.effictiveHeadache,
    required this.treatmentHeadaches,
  });

  HeadacheModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['headacheimage'];
    diseaseName = json['disease_name_headache'];
    symptomsDiseaseHeadache = json['Symptoms_disease_headache'];
    treatmentHeadaches = json['treatment_headache'];
    effictiveHeadache = json['Effective_Material_headache'];
  }
  Map<String, dynamic> tojson() {
    return {
      '_id': id,
      'headacheimage': image,
      'disease_name_headache': diseaseName,
      'Symptoms_disease_headache': symptomsDiseaseHeadache,
      'treatment_headache': treatmentHeadaches,
      'Effective_Material_headache': effictiveHeadache,
    };
  }
}
