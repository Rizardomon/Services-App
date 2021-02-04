import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:services_app/app/models/place_model.dart';
import 'package:services_app/app/repositories/place_repository_interface.dart';

class PlaceRepository implements IPlaceRepository {
  final FirebaseFirestore firestore;

  PlaceRepository(this.firestore);

  @override
  Stream<List<PlaceModel>> getPlaces() {
    return firestore.collection('places').snapshots().map((query) {
      return query.docs.map((doc) {
        return PlaceModel.fromDocument(doc);
      }).toList();
    });
  }
}
