import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/data/models/ship.dart';

class FirebaseShipDataSource {
  final FirebaseFirestore firestore;

  FirebaseShipDataSource({required this.firestore});

  Future<List<Ship>> getShips() async {
    var snapshot = await firestore.collection('ships').get();
    return snapshot.docs.map((doc) => Ship.fromMap(doc.data())).toList();
  }
}
