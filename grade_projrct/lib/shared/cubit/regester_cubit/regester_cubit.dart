import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/constant/const.dart';
import 'package:grade_projrct/models/user_model.dart';
import 'package:grade_projrct/shared/states/regester_states.dart';
import 'package:http/http.dart' as http;

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_off_outlined;
  IconData confirm_suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  bool isConfirmPassword = true;

  void signUp({
    required String email,
    required String password,
    required String name,
    required String gender,
    required String phone,
    required String userId,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        gender: gender,
        phone: phone,
        user_id: '123',
      );
      http.Response res = await http.post(
          Uri.parse('$baseUrl/api/user/subscribers'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          });

      httpErrorHandel(
          response: res,
          onSuccess: () async {
            emit(RegisterLoadingStates());

            emit(RegisterSuccessStates());
            print('donee');
          });
    } catch (error) {
      // snackBar(title: 'msg', message: error.toString(), color: mainColor);
      print(error.toString());

      emit(RegisterErrorStates(error.toString()));
    }
  }

  void changeSuffixRegisterScreen() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RegisterSuffixIconsStates());
  }

  void changecConfirmSuffixRegisterScreen() {
    isConfirmPassword = !isConfirmPassword;
    confirm_suffix = isConfirmPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(RegisterSuffixIconsStates());
  }

  String dropdownvalue = 'غير محدد';
  var items = [
    'غير محدد',
    'ذكر',
    'انثي',
  ];
  void chosseItem() {
    (String newValue) {
      dropdownvalue = newValue;
    };
    emit(RegisterDropMenusStates());
  }

  void httpErrorHandel({
    required http.Response response,
    required VoidCallback onSuccess,
  }) {
    switch (response.statusCode) {
      case 200:
        onSuccess();
        emit(RegisterSuccessStates());

        break;
      case 400:
        emit(RegisterErrorStates(response.body));

        break;
      case 500:
        emit(RegisterErrorStates(response.body));
        break;
      default:
        emit(RegisterErrorStates(response.body));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoadingStates());
      http.Response res = await http.post(Uri.parse('$baseUrl/api/user/logins'),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          });

      httpErrorHandel(
          response: res,
          onSuccess: () async {
            emit(RegisterSuccessStates());
            print('donee');
          });
    } catch (error) {
      print(error.toString());
      emit(RegisterErrorStates(error.toString()));
    }
  }
}
