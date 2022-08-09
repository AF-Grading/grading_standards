import 'package:app_prototype/models/Squadrons.dart';
import 'package:app_prototype/models/application_state.dart';
import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../pages/training_shop_page.dart';

class TrainingShopView extends StatelessWidget {
  const TrainingShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<Squadron>>(
      builder: (context, squadronss, child) {
        if (squadronss.isEmpty) {
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        } else {
          final user = context.watch<ApplicationState>().user;
          final squad =
              squadronss.firstWhere((squad) => squad.squad == user.squad);
          final squadrons = user.permission == Permission.training_shop
              ? squadronss.where((squady) => squady.wing == squad.wing).toList()
              : squadronss;
          return ListView.builder(
              itemCount:
                  squadrons.length, //context.watch<List<Squadron>>().length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrainingShopPage(
                            instructor: false,
                            squad: context.watch<List<Squadron>>()[index].squad,
                            gradeSheets: context
                                .watch<List<GradeSheet>>()
                                .where((element) {
                              bool returnVar = false;
                              try {
                                context
                                    .watch<List<UserSetting>>()
                                    .forEach((user) {
                                  if (user.email == element.studentId) {
                                    if (user.squad ==
                                        context
                                            .watch<List<Squadron>>()[index]
                                            .squad) {
                                      returnVar = true;
                                      throw "";
                                    }
                                  }
                                });
                              } catch (e) {
                                print(e);
                              }

                              return returnVar;
                            }).toList()),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      squadrons[index].image != null
                          ? SizedBox(
                              height: 150,
                              width: 150,
                              child: CachedNetworkImage(
                                imageUrl: squadrons[index].image!,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                                context.watch<List<Squadron>>()[index].squad)),
                      ),
                    ],
                  ),
                );
              });
        }
      },
    );
  }
}
