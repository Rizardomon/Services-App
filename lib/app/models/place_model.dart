import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel {
  String address;
  String address2;
  String address3;
  String city;
  Timestamp createdAt;
  int lockerQuantity;
  String name;
  int number;
  String state;
  String status;
  int tier;
  String type;
  Timestamp updateAt;
  String zipCode;

  DocumentReference reference;

  PlaceModel({
    this.address,
    this.address2,
    this.address3,
    this.city,
    this.createdAt,
    this.lockerQuantity,
    this.number,
    this.state,
    this.status,
    this.tier,
    this.type,
    this.updateAt,
    this.zipCode,
    this.name,
    this.reference,
  });

  factory PlaceModel.fromDocument(DocumentSnapshot doc) {
    return PlaceModel(
      address: doc['address'],
      address2: doc['address2'],
      address3: doc['address3'],
      city: doc['city'],
      createdAt: doc['createdAt'],
      lockerQuantity: doc['lockerQuantity'],
      number: doc['number'],
      state: doc['state'],
      status: doc['status'],
      tier: doc['tier'],
      type: doc['name'],
      updateAt: doc['updateAt'],
      zipCode: doc['zipCode'],
      name: doc['name'],
      reference: doc.reference,
    );
  }
}
