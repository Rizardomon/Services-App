import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel {
  String name;

  DocumentReference reference;

  PlaceModel({
    this.name,
    this.reference,
  });

  factory PlaceModel.fromDocument(DocumentSnapshot doc) {
    return PlaceModel(
      name: doc['name'],
      reference: doc.reference,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;

    return data;
  }
}
