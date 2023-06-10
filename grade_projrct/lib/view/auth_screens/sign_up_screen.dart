import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/shared/cubit/regester_cubit/regester_cubit.dart';
import 'package:grade_projrct/shared/states/regester_states.dart';
import 'package:grade_projrct/view/auth_screens/login_screen.dart';
import 'package:grade_projrct/view/screens/home_screen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../constant/const.dart';
import '../../shared/components.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, Object? state) {
      if (state is RegisterSuccessStates) {
        navigateAndFinish(context, const HomeScreen());
      } else if (state is RegisterErrorStates) {
        final snackBar = SnackBar(
          content: const Text(' هذا الحساب موجود من قبل ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: (Colors.red),
          action: SnackBarAction(
            label: ' ',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }, builder: ((context, state) {
      return Scaffold(
        backgroundColor: mainColor.withOpacity(0.7),
        appBar: AppBar(
          backgroundColor: mainColor.withOpacity(0.4),
          elevation: 0.01,
          title: Row(
            children: [
              SizedBox(
                width: width / 30,
              ),
              const Text('تسجيل ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold)),
              Text('حساب',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 38,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: hight / 1.2),
                    Container(
                      height: hight / 1.28,
                      width: hight / 2.2,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white.withOpacity(0.9),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18))),
                      child: Padding(
                        padding: EdgeInsets.all(hight / 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    defaultTextField(
                                        label: 'الاسم',
                                        prefix: Icons.person,
                                        type: TextInputType.text,
                                        validate: (String? value) {
                                          if (!RegExp(validationName)
                                                  .hasMatch(value!) ||
                                              value.isEmpty) {
                                            return 'الاسم غير صحيح';
                                          }
                                        },
                                        controller: nameController),
                                    SizedBox(
                                      height: hight / 45,
                                    ),
                                    defaultTextField(
                                        label: 'البريد الالكتروني',
                                        prefix: Icons.email_outlined,
                                        type: TextInputType.emailAddress,
                                        validate: (value) {
                                          if (!RegExp(validationEmail)
                                                  .hasMatch(value!) ||
                                              value.toString().isEmpty) {
                                            return 'البريد غير صحيح';
                                          }
                                        },
                                        controller: emailController),
                                    SizedBox(
                                      height: hight / 45,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.grey.shade300
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: InternationalPhoneNumberInput(
                                        maxLength: 12,
                                        errorMessage: 'رقم الهاتف غير صحيح ',
                                        hintText: 'رقم الهاتف',
                                        onInputChanged: (PhoneNumber number) {
                                          print(number.phoneNumber);
                                        },
                                        onInputValidated: (bool value) {
                                          print(value);
                                        },
                                        selectorConfig: const SelectorConfig(
                                          selectorType: PhoneInputSelectorType
                                              .BOTTOM_SHEET,
                                        ),
                                        ignoreBlank: false,
                                        autoValidateMode:
                                            AutovalidateMode.disabled,
                                        selectorTextStyle: const TextStyle(
                                            color: Colors.black),
                                        textFieldController: phoneController,
                                        formatInput: true,
                                        keyboardType: const TextInputType
                                                .numberWithOptions(
                                            signed: true, decimal: true),
                                        inputBorder: const OutlineInputBorder(),
                                        onSaved: (PhoneNumber number) {
                                          print('On Saved: $number');
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: hight / 45,
                                    ),
                                    defaultTextField(
                                        label: 'كلمه المرور',
                                        prefix: Icons.lock_outline_rounded,
                                        type: TextInputType.text,
                                        isPassword: RegisterCubit.get(context)
                                            .isPassword,
                                        suffix:
                                            RegisterCubit.get(context).suffix,
                                        suffixPress: () {
                                          RegisterCubit.get(context)
                                              .changeSuffixRegisterScreen();
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'لا يمكنك ترك الخانه فارغه';
                                          }
                                        },
                                        controller: passwordController),
                                    SizedBox(
                                      height: hight / 45,
                                    ),
                                    defaultTextField(
                                        label: 'تاكيد كلمه المرور',
                                        prefix: Icons.lock_outline_rounded,
                                        type: TextInputType.text,
                                        isPassword: RegisterCubit.get(context)
                                            .isConfirmPassword,
                                        suffix: RegisterCubit.get(context)
                                            .confirm_suffix,
                                        suffixPress: () {
                                          RegisterCubit.get(context)
                                              .changecConfirmSuffixRegisterScreen();
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'لا يمكنك ترك الخانه فارغه';
                                          }
                                          if (value !=
                                              passwordController.text) {
                                            return 'الرمز غير متطابق';
                                          }
                                        },
                                        controller: confirmPasswordController),
                                    SizedBox(
                                      height: hight / 45,
                                    ),
                                    const Align(
                                        child: Text('النوع',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                        alignment: Alignment.centerRight),
                                    Container(
                                      height: hight / 15,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: DropdownButton(
                                        value: RegisterCubit.get(context)
                                            .dropdownvalue,
                                        icon: const Align(
                                            child: Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            alignment: Alignment.centerRight),
                                        items: RegisterCubit.get(context)
                                            .items
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            onTap: () {
                                              RegisterCubit.get(context)
                                                  .dropdownvalue = items;
                                              print(items);
                                            },
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          RegisterCubit.get(context)
                                              .chosseItem();
                                          const Spacer();
                                          const Icon(
                                              Icons.arrow_downward_sharp);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: hight / 45,
                                    ),
                                    state is RegisterLoadingStates
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: width / 8,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape: const StadiumBorder(),
                                                backgroundColor: mainColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 14),
                                              ),
                                              onPressed: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  RegisterCubit.get(context)
                                                      .signUp(
                                                          email: emailController
                                                              .text,
                                                          password:
                                                              passwordController
                                                                  .text,
                                                          name: nameController
                                                              .text,
                                                          phone: phoneController
                                                              .text,
                                                          gender: RegisterCubit
                                                                  .get(context)
                                                              .dropdownvalue,
                                                          userId: '');
                                                } else {
                                                  final snackBar = SnackBar(
                                                    // ignore: prefer_const_constructors
                                                    content: Text(
                                                        'فشل تسجيل الحساب تأكد من البيانات المدخله !',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    backgroundColor:
                                                        (Colors.red),
                                                    action: SnackBarAction(
                                                      label: '',
                                                      onPressed: () {},
                                                    ),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                              },
                                              child: const Text(
                                                'تسجيل',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('لديك حساب بالفعل؟ ',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.black)),
                                        SizedBox(
                                          width: width / 80,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            navigateAndFinish(
                                                context, const LoginScreen());
                                          },
                                          child: Text(
                                            'سجل هنا',
                                            style: TextStyle(color: mainColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      );
    }));
  }
}
