import 'package:flutter/material.dart';

import '../models/grade_enums.dart';
import '/models/cts_list.dart';
import '/models/user_setting.dart';

class PassingScoreTextField extends StatelessWidget {
  const PassingScoreTextField(
      {Key? key, required this.ctsItem, required this.student})
      : super(key: key);

  final CTSItem ctsItem;
  final UserSetting student;

  @override
  Widget build(BuildContext context) {
    // gets the first score item depending on isAirdrop
    String getScore() {
      if (ctsItem.isAirdrop) {
        AirDropTableDescription ad =
            airDropDescriptions.firstWhere((ad) => ad.id == ctsItem.id);
        switch (student.adQual) {
          case AdQual.none:
            return "";
          case AdQual.ldad:
            return ad.ldad.toString();
          case AdQual.adip:
            return ad.adip.toString();
          case AdQual.acad:
            return ad.acad.toString();
          case AdQual.cpad:
            return ad.cpad.toString();
        }
      } else {
        TableDescription td =
            tableDescriptions.firstWhere((td) => td.id == ctsItem.id);
        switch (student.pilotQual) {
          case PilotQual.fpc:
            return td.fpc.toString();
          case PilotQual.fpq:
            return td.fpq.toString();
          case PilotQual.ip:
            return td.ip.toString();
          case PilotQual.mp:
            return td.mp.toString();
        }
      }
    }

    String score = getScore();

    return Text("PS: $score");
  }
}
