import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:services_app/app/models/place_model.dart';
import 'package:services_app/app/models/post_model.dart';
import 'package:services_app/app/repositories/place_repository_interface.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PlaceRepository implements IPlaceRepository {
  final Firestore firestore;
  final placeCollection = Firestore.instance.collection('place');
  PlaceRepository(this.firestore);

  @override
  Stream<List<PlaceModel>> getPlaces() {
    return firestore.collection('place').snapshots().map((query) {
      return query.documents.map((doc) {
        return PlaceModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future<Post> reserveLocker(PlaceModel model) async {
    final String _domain = "https://limeapidev2.herokuapp.com/api";
    final _accessToken = "r:d16d32564372416592dbeda45108f292";

    try {
      var response = await http.post(
        _domain + "/booklocker/LimeClean",
        headers: {
          "X-Parse-Session-Token": _accessToken,
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "placeName": "Teste 1 X",
            "lockerSize": "2",
            "nrOfDays": "3",
            "document": "12345678909",
            "supplierNumber": "12345678",
            "companyId": "001"
          },
        ),
      );
      var locker;
      if (response.statusCode == 200) {
        locker = Post.fromJson(json.decode(response.body));
      } else {
        throw Exception('Erro ao fazer reserva');
      }
      print(response.body);
      return locker;
    } catch (e) {
      rethrow;
    }
  }
}
