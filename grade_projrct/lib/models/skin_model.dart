import 'dart:convert';
import 'package:flutter/foundation.dart';

class SkinModel {
  String? diseaseName;
  String? id;
  String? symptomsDiseaseSkin;
  String? treatmentSkins;
  String? effictiveSkin;
  String? images;

  SkinModel({
    required this.id,
    required this.diseaseName,
    required this.symptomsDiseaseSkin,
    required this.effictiveSkin,
    required this.treatmentSkins,
    required this.images,
  });

  SkinModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    images = json['skinimage'];
    diseaseName = json['disease_name_skin'];
    symptomsDiseaseSkin = json['Symptoms_disease_skin'];
    treatmentSkins = json['treatment_skin'];
    effictiveSkin = json['Effective_Material_skin'];
  }
  Map<String, dynamic> tojson() {
    return {
      '_id': id,
      'disease_name_skin': diseaseName,
      'Symptoms_disease_skin': symptomsDiseaseSkin,
      'treatment_skin': treatmentSkins,
      'Effective_Material_skin': effictiveSkin,
      'skiniimage': images,
    };
  }
}
