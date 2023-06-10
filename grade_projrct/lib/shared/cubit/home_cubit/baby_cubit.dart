import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../constant/const.dart';

import '../../../models/baby_model.dart';
import '../../states/baby_state.dart';

class BabyCubit extends Cubit<BabyStates> {
  BabyCubit() : super(BabyInitialStates());
  static BabyCubit get(context) => BlocProvider.of(context);
  var BabyList = <BabyModel>[];

  Future<List<BabyModel>> fetchBaby() async {
    emit(BabyLoadingStates());
    final response = await http.get(Uri.parse('$baseUrl/api/user/Babys'));

    if (response.statusCode == 200) {
      List<BabyModel> model = (jsonDecode(response.body) as List)
          .map((data) => BabyModel.fromJson(data))
          .toList();
      BabyList = model;

      emit(BabySuccessStates());
      return model;
    } else {
      emit(BabyErrorStates(response.statusCode.toString()));

      throw Exception('Failed to load posts ${response.statusCode}');
    }
  }
}
