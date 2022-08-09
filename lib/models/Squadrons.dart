import 'package:cloud_firestore/cloud_firestore.dart';

class Squadron {
  final String squad;
  final String? wing;
  final String? image;

  Squadron({required this.squad, this.image, this.wing});

  factory Squadron.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Squadron(
      squad: data?['squad'],
      wing: data?['wing'],
      image: data?['image'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "squad": squad,
      "image": image,
      "wing": wing,
    };
  }
}
