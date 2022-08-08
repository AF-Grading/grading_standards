import 'package:app_prototype/models/Squadrons.dart';
import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../pages/training_shop_page.dart';

class TrainingShopView extends StatelessWidget {
  const TrainingShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: context.watch<List<Squadron>>().length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(
                child: Text(context.watch<List<Squadron>>()[index].squad)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingShopPage(
                      instructor: false,
                      squad: context.watch<List<Squadron>>()[index].squad,
                      gradeSheets:
                          context.watch<List<GradeSheet>>().where((element) {
                        bool returnVar = false;
                        try {
                          context.watch<List<UserSetting>>().forEach((user) {
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
          );
        });
  }
}
