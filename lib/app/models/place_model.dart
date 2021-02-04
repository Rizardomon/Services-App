import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel {
  String address;

  DocumentReference reference;

  PlaceModel({
    this.reference,
    this.address = '',
  });

  factory PlaceModel.fromDocument(DocumentSnapshot doc) {
    return PlaceModel(
      address: doc['address'],
      reference: doc.reference,
    );
  }
}
