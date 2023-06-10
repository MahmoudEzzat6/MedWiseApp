import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_projrct/constant/const.dart';

import '../../shared/components.dart';
import '../../shared/cubit/home_cubit/ears_cubit.dart';
import '../../shared/states/ears_state.dart';
import '../details_screen/ear_details.dart';
import '../details_screen/skin_details.dart';

class Earscreen extends StatelessWidget {
  const Earscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<EarsCubit, EarsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
             appBar: AppBar(
                title: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () async {
                    await EarsCubit.get(context).fetchEars();
                  }),
            )),
            body: state is EarsLoadingStates || state is EarsErrorStates
                ? Center(child: loading(context, secMainColor))
                : FutureBuilder(
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              height: hight / 25,
                            );
                          },
                          itemBuilder: (context, index) {
                            return itemBuilder(
                              context: context,
                              diseaseName: EarsCubit.get(context)
                                  .earsList[index]
                                  .diseaseName,
                              image: EarsCubit.get(context)
                                  .earsList[index]
                                  .effictiveEar,
                              treatmentname: EarsCubit.get(context)
                                  .earsList[index]
                                  .treatmentEars,
                              onTap: () {
                                navigateTo(
                                    context,
                                    EarDetailScreen(
                                      model: EarsCubit.get(context)
                                          .earsList[index],
                                    ));
                              },
                            );
                          },
                          itemCount: EarsCubit.get(context).earsList.length,
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
