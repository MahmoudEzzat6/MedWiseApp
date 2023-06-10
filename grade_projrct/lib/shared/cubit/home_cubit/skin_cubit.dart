import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../constant/const.dart';

import '../../../models/skin_model.dart';

import '../../states/skin_states.dart';

class SkinCubit extends Cubit<SkinStates> {
  SkinCubit() : super(SkinInitialStates());
  static SkinCubit get(context) => BlocProvider.of(context);
  var skinList = <SkinModel>[];

  Future<List<SkinModel>> fetchSkin() async {
    emit(SkinLoadingStates());
    final response = await http.get(Uri.parse('$baseUrl/api/user/skins'));

    if (response.statusCode == 200) {
      List<SkinModel> model = (jsonDecode(response.body) as List)
          .map((data) => SkinModel.fromJson(data))
          .toList();
      skinList = model;
      print('heree Skin ${model[0].id}');
      print('SE Skin ${skinList[0].id}');
      emit(SkinSuccessStates());
      return model;
    } else {
      emit(SkinErrorStates(response.statusCode.toString()));

      throw Exception('Failed to load posts ${response.statusCode}');
    }
  }
}
