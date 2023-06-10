import 'dart:convert';

class HairModel {
  String? diseaseName;
  String? id;
  String? image;
  String? symptomsDiseaseHair;
  String? treatmentHairs;
  String? effictiveHair;

  HairModel({
    required this.id,
    required this.image,
    required this.diseaseName,
    required this.symptomsDiseaseHair,
    required this.effictiveHair,
    required this.treatmentHairs,
  });

  HairModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['hairimage'];
    diseaseName = json['disease_name_hair'];
    symptomsDiseaseHair = json['Symptoms_disease_hair'];
    treatmentHairs = json['treatment_hair'];
    effictiveHair = json['Effective_Material_hair'];
  }
  Map<String, dynamic> tojson() {
    return {
      '_id': id,
      'hairimage': image,
      'disease_name_hair': diseaseName,
      'Symptoms_disease_hair': symptomsDiseaseHair,
      'treatment_hair': treatmentHairs,
      'Effective_Material_hair': effictiveHair,
    };
  }
}
