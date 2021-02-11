import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel {
  String placeName;
  String lockerSize;
  String supplierNumber;
  String companyId;
  String bookingNumber;
  String document;

  DocumentReference reference;

  PlaceModel({
    this.placeName,
    this.lockerSize,
    this.supplierNumber,
    this.companyId,
    this.bookingNumber,
    this.document,
    this.reference,
  });

  factory PlaceModel.fromDocument(DocumentSnapshot doc) {
    return PlaceModel(
      placeName: doc['placeName'],
      lockerSize: doc['lockerSize'],
      supplierNumber: doc['supplierNumber'],
      companyId: doc['companyId'],
      bookingNumber: doc['bookingNumber'],
      document: doc['document'],
      reference: doc.reference,
    );
  }

  PlaceModel.fromJson(Map<String, dynamic> json) {
    placeName = json['placeName'];
    lockerSize = json['lockerSize'];
    bookingNumber = json['bookingNumber'];
    document = json['document'];
    supplierNumber = json['supplierNumber'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeName'] = this.placeName;
    data['lockerSize'] = this.lockerSize;
    data['bookingNumber'] = this.bookingNumber;
    data['document'] = this.document;
    data['supplierNumber'] = this.supplierNumber;
    data['companyId'] = this.companyId;
    return data;
  }
}
