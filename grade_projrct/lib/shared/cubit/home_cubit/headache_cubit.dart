import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../constant/const.dart';

import '../../../models/headache_model.dart';
import '../../states/headache.states.dart';

class HeadacheCubit extends Cubit<HeadacheStates> {
  HeadacheCubit() : super(HeadacheInitialStates());
  static HeadacheCubit get(context) => BlocProvider.of(context);
  var headacheList = <HeadacheModel>[];

  Future<List<HeadacheModel>> fetchHeadache() async {
    emit(HeadacheLoadingStates());
    final response = await http.get(Uri.parse('$baseUrl/api/user/Headaches'));

    if (response.statusCode == 200) {
      List<HeadacheModel> model = (jsonDecode(response.body) as List)
          .map((data) => HeadacheModel.fromJson(data))
          .toList();
      headacheList = model;
      print('heree Headache ${model[0].id}');
      print('SE Headache ${headacheList[0].id}');
      emit(HeadacheSuccessStates());
      return model;
    } else {
      emit(HeadacheErrorStates(response.statusCode.toString()));

      throw Exception('Failed to load posts ${response.statusCode}');
    }
  }
}
