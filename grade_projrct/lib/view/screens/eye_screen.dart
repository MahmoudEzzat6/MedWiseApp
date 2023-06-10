import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/constant/const.dart';

import 'package:grade_projrct/shared/cubit/home_cubit/eyes_cubit.dart';
import 'package:grade_projrct/shared/states/eye_state.dart';

import '../../shared/components.dart';
import '../details_screen/eye_details.dart';

class EyeScreen extends StatelessWidget {
  const EyeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    return BlocConsumer<EyesCubit, EyesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () async {
                    await EyesCubit.get(context).fetchPosts();
                  }),
            )),
            body: state is EyesLoadingStates || state is EyesErrorStates
                ? Center(child: loading(context, mainColor))
                : FutureBuilder(
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await EyesCubit.get(context).fetchPosts();
                          },
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                height: hight / 25,
                              );
                            },
                            itemBuilder: (context, index) {
                              return itemBuilder(
                                  context: context,
                                  diseaseName: EyesCubit.get(context)
                                      .EyesList[index]
                                      .diseaseName,
                                  treatmentname: EyesCubit.get(context)
                                      .EyesList[index]
                                      .treatmentEyes,
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        EyesDetailScreen(
                                          model: EyesCubit.get(context)
                                              .EyesList[index],
                                        ));
                                  },
                                  image: EyesCubit.get(context)
                                      .EyesList[index]
                                      .effictiveEyes);
                            },
                            itemCount: EyesCubit.get(context).EyesList.length,
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
