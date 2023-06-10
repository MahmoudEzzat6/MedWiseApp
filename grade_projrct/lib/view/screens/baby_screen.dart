import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/constant/const.dart';
import 'package:grade_projrct/view/details_screen/skin_details.dart';

import '../../shared/components.dart';
import '../../shared/cubit/home_cubit/baby_cubit.dart';
import '../../shared/cubit/home_cubit/ears_cubit.dart';
import '../../shared/states/baby_state.dart';
import '../../shared/states/ears_state.dart';
import '../details_screen/baby_details.dart';

class Babyscreen extends StatelessWidget {
  const Babyscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<BabyCubit, BabyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
               appBar: AppBar(
                title: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () async {
                    await BabyCubit.get(context).fetchBaby();
                  }),
            )),
            body: state is BabyLoadingStates || state is BabyErrorStates
                ? Center(child: loading(context, mainColor))
                : FutureBuilder(
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await BabyCubit.get(context).fetchBaby();
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
                                  diseaseName: BabyCubit.get(context)
                                      .BabyList[index]
                                      .diseaseName,
                                  treatmentname: BabyCubit.get(context)
                                      .BabyList[index]
                                      .treatmentbabys,
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        BabyDetailScreen(
                                          model: BabyCubit.get(context)
                                              .BabyList[index],
                                        ));
                                  },
                                  image: BabyCubit.get(context)
                                      .BabyList[index]
                                      .effictiveBaby);
                            },
                            itemCount: BabyCubit.get(context).BabyList.length,
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
