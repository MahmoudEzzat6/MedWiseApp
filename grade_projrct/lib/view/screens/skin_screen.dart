import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/constant/const.dart';

import '../../shared/components.dart';
import '../../shared/cubit/home_cubit/skin_cubit.dart';

import '../../shared/states/ears_state.dart';
import '../../shared/states/skin_states.dart';
import '../details_screen/skin_details.dart';

class Skinscreen extends StatelessWidget {
  const Skinscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<SkinCubit, SkinStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
        appBar: AppBar(
                title: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () async {
                    await SkinCubit.get(context).fetchSkin();
                  }),
            )),
            body: state is SkinLoadingStates || state is SkinErrorStates
                ? Center(child: loading(context, secMainColor))
                : FutureBuilder(
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await SkinCubit.get(context).fetchSkin();
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
                                  image: SkinCubit.get(context)
                                      .skinList[index]
                                      .effictiveSkin,
                                  context: context,
                                  diseaseName: SkinCubit.get(context)
                                      .skinList[index]
                                      .diseaseName,
                                  treatmentname: SkinCubit.get(context)
                                      .skinList[index]
                                      .treatmentSkins,
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        SkinDetailScreen(
                                          model: SkinCubit.get(context)
                                              .skinList[index],
                                        ));
                                  });
                            },
                            itemCount: SkinCubit.get(context).skinList.length,
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
