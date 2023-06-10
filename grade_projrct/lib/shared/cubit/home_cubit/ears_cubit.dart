import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../constant/const.dart';
import '../../../models/ears_model.dart';
import '../../../models/ears_model.dart';
import '../../states/ears_state.dart';
import '../../states/eye_state.dart';

class EarsCubit extends Cubit<EarsStates> {
  EarsCubit() : super(EarsInitialStates());
  static EarsCubit get(context) => BlocProvider.of(context);
  var earsList = <EarsModel>[];

  Future<List<EarsModel>> fetchEars() async {
    emit(EarsLoadingStates());
    final response = await http.get(Uri.parse('$baseUrl/api/user/earss'));

    if (response.statusCode == 200) {
      List<EarsModel> model = (jsonDecode(response.body) as List)
          .map((data) => EarsModel.fromJson(data))
          .toList();
      earsList = model;
      print('heree ears ${model[0].id}');
      print('SE ears ${earsList[0].id}');
      emit(EarsSuccessStates());
      return model;
    } else {
      emit(EarsErrorStates(response.statusCode.toString()));

      throw Exception('Failed to load posts ${response.statusCode}');
    }
  }
}
