import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../constant/const.dart';

import '../../../models/kidneys_model.dart';

import '../../states/kidney_states.dart';

class KidneysCubit extends Cubit<KidneysStates> {
  KidneysCubit() : super(KidneysInitialStates());
  static KidneysCubit get(context) => BlocProvider.of(context);
  var kidneysList = <KidneysModel>[];

  Future<List<KidneysModel>> fetchKidneys() async {
    emit(KidneysLoadingStates());
    final response = await http.get(Uri.parse('$baseUrl/api/user/kidneys'));

    if (response.statusCode == 200) {
      List<KidneysModel> model = (jsonDecode(response.body) as List)
          .map((data) => KidneysModel.fromJson(data))
          .toList();
      kidneysList = model;
      print('heree Kidneys ${model[0].id}');
      print('SE Kidneys ${kidneysList[0].id}');
      emit(KidneysSuccessStates());
      return model;
    } else {
      emit(KidneysErrorStates(response.statusCode.toString()));

      throw Exception('Failed to load posts ${response.statusCode}');
    }
  }
}
