import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/constant/const.dart';

import '../../shared/components.dart';
import '../../shared/cubit/home_cubit/kidneys_cubit.dart';
import '../../shared/states/ears_state.dart';
import '../../shared/states/kidney_states.dart';
import '../details_screen/kidneys_details.dart';
import '../details_screen/skin_details.dart';

class Kidneysscreen extends StatelessWidget {
  const Kidneysscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<KidneysCubit, KidneysStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.cyan[300],
                title: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: const Icon(Icons.refresh_rounded),
                      onPressed: () async {
                        await KidneysCubit.get(context).fetchKidneys();
                      }),
                )),
            body: state is KidneysLoadingStates || state is KidneysErrorStates
                ? Center(child: loading(context, secMainColor))
                : FutureBuilder(
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await KidneysCubit.get(context).fetchKidneys();
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
                                  diseaseName: KidneysCubit.get(context)
                                      .kidneysList[index]
                                      .diseaseName,
                                  treatmentname: KidneysCubit.get(context)
                                      .kidneysList[index]
                                      .treatmentKidneyss,
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        KidneysDetailScreen(
                                          model: KidneysCubit.get(context)
                                              .kidneysList[index],
                                        ));
                                  },
                                  image: KidneysCubit.get(context)
                                      .kidneysList[index]
                                      .effictiveKidneys);
                            },
                            itemCount:
                                KidneysCubit.get(context).kidneysList.length,
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
