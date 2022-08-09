import 'package:cloud_firestore/cloud_firestore.dart';

class GradingCriterion {
  final int id;
  final String criterion;
  final String performance;
  final String standards;
  final Map<String, int>? pilotQuals;
  final Map<String, int>? adQuals;

  GradingCriterion(
      {required this.id,
      required this.criterion,
      required this.performance,
      required this.standards,
      this.pilotQuals,
      this.adQuals});

  factory GradingCriterion.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GradingCriterion(
        id: data?['id'] ?? 0,
        criterion: data?['criterion'],
        performance: data?['performance'],
        standards: data?['standards'],
        pilotQuals: data?['pilotQualifications'] != null
            ? Map<String, int>.from(data?['pilotQualifications'])
            : null,
        adQuals: data?['adQualifications'] != null
            ? Map<String, int>.from(data?['adQualifications'])
            : null);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "criterion": criterion,
      "performance": performance,
      "standards": standards,
      "pilotQualifications": pilotQuals,
      "adQualifications": adQuals,
    };
  }
}
