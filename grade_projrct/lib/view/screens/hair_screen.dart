import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/constant/const.dart';

import '../../shared/components.dart';
import '../../shared/cubit/home_cubit/hair_cubit.dart';
import '../../shared/states/ears_state.dart';
import '../../shared/states/hair_states.dart';
import '../details_screen/hair_details.dart';
import '../details_screen/skin_details.dart';

class Hairscreen extends StatelessWidget {
  const Hairscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<HairCubit, HairStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
                 appBar: AppBar(
                title: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () async {
                    await HairCubit.get(context).fetchHair();
                  }),
            )),
            body: state is HairLoadingStates || state is HairErrorStates
                ? Center(child: loading(context, mainColor))
                : FutureBuilder(
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await HairCubit.get(context).fetchHair();
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
                                  diseaseName: HairCubit.get(context)
                                      .hairList[index]
                                      .diseaseName,
                                  treatmentname: HairCubit.get(context)
                                      .hairList[index]
                                      .treatmentHairs,
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        HairDetailScreen(
                                          model: HairCubit.get(context)
                                              .hairList[index],
                                        ));
                                  },
                                  image: HairCubit.get(context)
                                      .hairList[index]
                                      .effictiveHair);
                            },
                            itemCount: HairCubit.get(context).hairList.length,
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
