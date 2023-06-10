import 'package:flutter/material.dart';
import 'package:grade_projrct/constant/const.dart';
import 'package:grade_projrct/view/auth_screens/login_screen.dart';
import 'package:grade_projrct/view/screens/home_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quickalert/quickalert.dart';

Widget defaultTextField({
  required TextEditingController? controller,
  textColor,
  TextInputType? type,
  Function()? onTap,
  Color? color,
  Color? hintColor,
  Function(String)? onChange,
  required String? Function(String?) validate,
  Function(String)? onSubmit,
  bool isPassword = false,
  required String? label,
  required IconData? prefix,
  iconColor,
  IconData? suffix,
  suffixColor,
  Function()? suffixPress,
}) {
  return TextFormField(
    showCursor: true,
    cursorColor: mainColor,
    style: TextStyle(color: color),
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    onChanged: onChange,
    onTap: onTap,
    onFieldSubmitted: onSubmit,
    validator: validate,
    decoration: InputDecoration(
      errorStyle: const TextStyle(color: Colors.red),
      labelStyle: const TextStyle(color: Colors.black),
      floatingLabelStyle: const TextStyle(color: Colors.blueGrey),
      labelText: label,
      prefixIcon: Icon(
        prefix,
        color: iconColor,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: suffixPress,
              icon: Icon(
                suffix,
                color: suffixColor,
              ))
          : null,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mainColor),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}

void navigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void snackBarr(context) {
  // {required title, required message, required Color? color, var time}) =>
  //{
  final snackBar = SnackBar(
    content: const Text('Success'),
    backgroundColor: (Colors.green),
    duration: const Duration(seconds: 3),
    elevation: 20,
    margin: const EdgeInsets.fromLTRB(35.0, 5.0, 15.0, 10.0),
    action: SnackBarAction(
      label: 'dismiss',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget defaultButton({
  double width = double.infinity,
  Color? background,
  Color? textColor,
  bool isUpper = true,
  required VoidCallback onTap,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(20)),
      width: width,
      // color: background,
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget loading(BuildContext context, Color color) {
  var hight = MediaQuery.of(context).size.height;
  return Center(
      child: LoadingAnimationWidget.inkDrop(
    color: color,
    size: hight / 20,
  ));
}

Future confirmData(BuildContext context) {
  return QuickAlert.show(
    context: context,
    title: 'تسجيل خروج',
    type: QuickAlertType.warning,
    text: 'هل حقا تريد تسجيل الخروج؟',
    confirmBtnText: 'نعم',
    cancelBtnText: 'لا',
    showCancelBtn: true,
    onCancelBtnTap: () {
      Navigator.pop(context);
    },
    onConfirmBtnTap: () {
      navigateAndFinish(context, const LoginScreen());
    },
    confirmBtnColor: Colors.red,
  );
}

Widget itemBuilder(
    {required BuildContext context,
    required String? diseaseName,
    required String? image,
    required Function? onTap(),
    required String? treatmentname}) {
  var hight = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        Image.network(
          '$image',
          fit: BoxFit.cover,
          height: hight / 8,
          width: width / 3,
          errorBuilder: (context, error, stackTrace) {
            return SizedBox(
              height: hight / 8,
              width: width / 3,
              child: (Icon(
                Icons.broken_image_rounded,
                color: Colors.black45,
                size: hight / 8,
              )),
            );
          },
        ),
        SizedBox(width: width / 25),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                widthFactor: width / 24,
                alignment: Alignment.topLeft,
                child: Text(
                  '$diseaseName',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SizedBox(
                height: hight / 105,
              ),
              Text(
                '$treatmentname',
                style: const TextStyle(fontSize: 16),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

















/*
1-info-->DONE
2-Search
3-trans

*/