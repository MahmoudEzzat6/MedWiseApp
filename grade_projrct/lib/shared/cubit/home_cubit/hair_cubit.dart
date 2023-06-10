import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../constant/const.dart';

import '../../../models/hair_model.dart';
import '../../states/hair_states.dart';

class HairCubit extends Cubit<HairStates> {
  HairCubit() : super(HairInitialStates());
  static HairCubit get(context) => BlocProvider.of(context);
  var hairList = <HairModel>[];

  Future<List<HairModel>> fetchHair() async {
    emit(HairLoadingStates());
    final response = await http.get(Uri.parse('$baseUrl/api/user/Hairs'));

    if (response.statusCode == 200) {
      List<HairModel> model = (jsonDecode(response.body) as List)
          .map((data) => HairModel.fromJson(data))
          .toList();
      hairList = model;
      print('heree Hair ${model[0].id}');
      print('SE Hair ${hairList[0].id}');
      emit(HairSuccessStates());
      return model;
    } else {
      emit(HairErrorStates(response.statusCode.toString()));

      throw Exception('Failed to load posts ${response.statusCode}');
    }
  }
}
