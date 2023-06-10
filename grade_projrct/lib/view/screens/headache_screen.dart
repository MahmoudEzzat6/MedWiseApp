import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/const.dart';
import '../../shared/components.dart';
import '../../shared/cubit/home_cubit/headache_cubit.dart';
import '../../shared/states/ears_state.dart';
import '../../shared/states/headache.states.dart';
import '../details_screen/head_details.dart';
import '../details_screen/skin_details.dart';

class Headachescreen extends StatelessWidget {
  const Headachescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<HeadacheCubit, HeadacheStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () async {
                    await HeadacheCubit.get(context).fetchHeadache();
                  }),
            )),
            body: state is HeadacheLoadingStates || state is HeadacheErrorStates
                ? Center(child: loading(context, mainColor))
                : FutureBuilder(
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await HeadacheCubit.get(context).fetchHeadache();
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
                                  diseaseName: HeadacheCubit.get(context)
                                      .headacheList[index]
                                      .diseaseName,
                                  treatmentname: HeadacheCubit.get(context)
                                      .headacheList[index]
                                      .treatmentHeadaches,
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        HeadDetailScreen(
                                          model: HeadacheCubit.get(context)
                                              .headacheList[index],
                                        ));
                                  },
                                  image: HeadacheCubit.get(context)
                                      .headacheList[index]
                                      .effictiveHeadache);
                            },
                            itemCount:
                                HeadacheCubit.get(context).headacheList.length,
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
