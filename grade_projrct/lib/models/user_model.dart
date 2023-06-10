import 'dart:convert';
import 'package:flutter/foundation.dart';

class User {
  late String id;
  late String name;
  late String password;
  late String email;
  late String gender;
  late String phone;
  late String user_id;

  //late String token;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.gender,
    required this.phone,
    required this.user_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'phone': phone,
      'user_id': user_id
    };
  }

  User.fromMap(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    password = json['password'] ?? '';
    email = json['email'] ?? '';
    gender = json['gender'] ?? '';
    phone = json['phone'] ?? '';
    user_id = json['user_id'] ?? '';
  }
  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
