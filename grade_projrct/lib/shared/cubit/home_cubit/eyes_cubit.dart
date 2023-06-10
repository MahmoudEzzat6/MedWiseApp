import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../constant/const.dart';
import '../../../models/eye_model.dart';
import '../../states/eye_state.dart';

class EyesCubit extends Cubit<EyesStates> {
  EyesCubit() : super(EyesInitialStates());
  static EyesCubit get(context) => BlocProvider.of(context);
  var EyesList = <EyesModel>[];

  Future<List<EyesModel>> fetchPosts() async {
    emit(EyesLoadingStates());
    final response = await http.get(Uri.parse('$baseUrl/api/user/eyess'));

    if (response.statusCode == 200) {
      List<EyesModel> model = (jsonDecode(response.body) as List)
          .map((data) => EyesModel.fromJson(data))
          .toList();
      EyesList = model;

      emit(EyesSuccessStates());
      return model;
    } else {
      emit(EyesErrorStates(response.statusCode.toString()));

      throw Exception('Failed to load posts ${response.statusCode}');
    }
  }
} 










// class EyesCubit extends Cubit<EyesStates> {
//   EyesCubit() : super(EyesInitialStates());
//   static EyesCubit get(context) => BlocProvider.of(context);
//   var EyesList = <EyesModel>[];

//   Future<List<EyesModel>> fetchPosts() async {
//     final response = await http.get(Uri.parse('$baseUrl/eyess'));
//     EyesModel? EyesModel;
//     if (response.statusCode == 200) {
//       List<EyesModel> model = (jsonDecode(response.body) as List)
//           .map((data) => EyesModel.fromJson(data))
//           .toList();
//       EyesList = model;
//       print('heree ${model[3].id}');
//       print('SE ${EyesList[2].id}');
//       return model;
//     } else {
//       ;
//       throw Exception('Failed to load posts ${response.statusCode}');
//     }
//   }

//   void httpErrorHandel({
//     required http.Response response,
//     required VoidCallback onSuccess,
//   }) {
//     switch (response.statusCode) {
//       case 200:
//         onSuccess();
//         emit(EyesSuccessStates());

//         break;
//       case 400:
//         print('${response.body}');
//         emit(EyesErrorStates(response.body));

//         break;
//       case 500:
//         // snackBar(
//         //     title: 'error', message: jsonDecode(response.body), color: mainColor);
//         emit(EyesErrorStates(response.body));
//         break;
//       default:
//         // snackBar(
//         //     title: 'msg2', message: jsonDecode(response.body), color: mainColor);
//         emit(EyesErrorStates(response.body));

//         print('${response.body}');
//     }
//   }
// } 








  // static Future<List<DiseaesModel>> getMedicine() async {
  //   var response = await http.get(Uri.parse('$baseUrl/eyess'));
  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     var data = response.body;
  //     print(data);
  //     return DiseaesModelFromJson(data);
  //   } else {
  //     print('Errorr');
  //     return throw Exception('Failed to Load the Product');
  //   }
  // }



 // void treatement({
  //   required String title,
  //   required String treat,
  //   required String subtitle,
  //   required String effective,
  // }) async {
  //   try {
  //     DiseaesModel Eyes = DiseaesModel(
  //       title: title,
  //       treat: treat,
  //       subtitle: subtitle,
  //       effictive: effective,
  //     );
      
  //     http.Response res = await http
  //         .get(Uri.parse('$baseUrl/eyess'), headers: <String, String>{});
  //     httpErrorHandel(
  //         response: res,
  //         onSuccess: () async {
  //           emit(EyesLoadingStates());
            
  //           emit(EyesSuccessStates());
  //           print('donee');
  //         });
  //   } catch (error) {
  //     // snackBar(title: 'msg', message: error.toString(), color: mainColor);
  //     print(error.toString());

  //     emit(EyesErrorStates(error.toString()));
  //   }
  // }

  // void httpErrorHandel({
  //   required http.Response response,
  //   required VoidCallback onSuccess,
  // }) {
  //   switch (response.statusCode) {
  //     case 201:
  //       onSuccess();
  //       emit(EyesSuccessStates());

  //       break;
  //     case 400:
  //       print('${response.body}');
  //       emit(EyesErrorStates(response.body));

  //       break;
  //     case 500:
  //       // snackBar(
  //       //     title: 'error', message: jsonDecode(response.body), color: mainColor);
  //       emit(EyesErrorStates(response.body));
  //       break;
  //     default:
  //       // snackBar(
  //       //     title: 'msg2', message: jsonDecode(response.body), color: mainColor);
  //       emit(EyesErrorStates(response.body));

  //       print('${response.body}');
  //   }
  // }
 // List<DiseaesModel> Eyess = [
  //   DiseaesModel('الام في العين مصاحبه الي احمرار', false),
  //   DiseaesModel('الام في العين مصاحبه لصداع في الرأس', false),
  //   DiseaesModel('الم في الجيوب الانفيه مع العين ', false),
  // ];
  // List<DiseaesModel> selectdEyess = [];

  // void changeState(int index, String name, bool isSelected) {
  //   Eyess[index].isSelected = !Eyess[index].isSelected;
  //   if (Eyess[index].isSelected == true) {
  //     selectdEyess.add(DiseaesModel(name, true));
  //     emit(EyesIconsStates());
  //   } else if (Eyess[index].isSelected == false) {
  //     selectdEyess
  //         .removeWhere(((element) => element.name == Eyess[index].name));
  //     emit(EyesIconsStates());
  //   }
  // }