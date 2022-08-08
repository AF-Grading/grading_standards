import 'package:cloud_firestore/cloud_firestore.dart';

class GradingParameter {
  final String paramName;

  final List<Param> params;

  GradingParameter({required this.paramName, required this.params});

  factory GradingParameter.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GradingParameter(
      paramName: data?['paramName'],
      params: data?['params'] is Iterable
          ? (data?['params'] as Iterable)
              .map((param) => Param(
                    param?['gradingItem'],
                    (param?['isUsed'] as bool),
                  ))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "paramName": paramName,
      "params": params.map((e) => e.toFirestore()).toList(),
    };
  }
}

class Param {
  final String gradingItem;
  final bool isUsed;
  Param(this.gradingItem, this.isUsed);

  Map<String, dynamic> toFirestore() {
    return {"gradingItem": gradingItem, "isUsed": isUsed};
  }

  factory Param.unMap(
    Map<String, dynamic> snapshot,
  ) {
    return Param(
      snapshot['gradingItem'],
      (snapshot['isUsed'] as bool),
    );
  }
}
