import 'package:services_app/app/models/place_model.dart';

abstract class IPlaceRepository {
  Stream<List<PlaceModel>> getPlaces();

  Future reserveLocker();

  // Future removeEntry(PlaceModel model);
}
