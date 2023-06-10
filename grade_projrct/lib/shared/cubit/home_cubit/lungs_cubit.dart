import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/shared/components.dart';
import 'package:http/http.dart' as http;
import '../../../constant/const.dart';

import '../../../models/breath_model.dart';
import '../../states/lungs_states.dart';

class LungsCubit extends Cubit<LungsStates> {
  LungsCubit() : super(LungsInitialStates());
  static LungsCubit get(context) => BlocProvider.of(context);
  var lungsList = <LungsModel>[];
  BuildContext? context;
  Future<List<LungsModel>> fetchLungs() async {
    emit(LungsLoadingStates());
    final response = await http.get(Uri.parse('$baseUrl/api/user/Lungss'));

    if (response.statusCode == 200) {
      List<LungsModel> model = (jsonDecode(response.body) as List)
          .map((data) => LungsModel.fromJson(data))
          .toList();
      lungsList = model;

      emit(LungsSuccessStates());
      return model;
    } else {
      emit(LungsErrorStates(response.statusCode.toString()));
      confirmData(context!);

      throw Exception('Failed to load posts ${response.statusCode}');
    }
  }
}
