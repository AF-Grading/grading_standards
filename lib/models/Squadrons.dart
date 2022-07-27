import 'package:cloud_firestore/cloud_firestore.dart';

class Squadron {
  final String squad;

  Squadron({required this.squad});

  factory Squadron.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Squadron(
      squad: data?['squad'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "squad": squad,
    };
  }
}
