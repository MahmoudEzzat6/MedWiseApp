import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/const.dart';
import '../../shared/components.dart';
import '../../shared/cubit/home_cubit/lungs_cubit.dart';

import '../../shared/states/lungs_states.dart';
import '../details_screen/lungs_details.dart';
import '../details_screen/skin_details.dart';

class Lungscreen extends StatelessWidget {
  const Lungscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<LungsCubit, LungsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () async {
                    await LungsCubit.get(context).fetchLungs();
                  }),
            )),
            body: state is LungsLoadingStates || state is LungsErrorStates
                ? Center(child: loading(context, secMainColor))
                : FutureBuilder(
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await LungsCubit.get(context).fetchLungs();
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
                                  diseaseName: LungsCubit.get(context)
                                      .lungsList[index]
                                      .diseaseName,
                                  treatmentname: LungsCubit.get(context)
                                      .lungsList[index]
                                      .treatmentLungss,
                                  onTap: () {
                                    navigateTo(
                                        context,
                                        LungsDetailScreen(
                                          model: LungsCubit.get(context)
                                              .lungsList[index],
                                        ));
                                  },
                                  image: LungsCubit.get(context)
                                      .lungsList[index]
                                      .effictiveLungs);
                            },
                            itemCount: LungsCubit.get(context).lungsList.length,
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
