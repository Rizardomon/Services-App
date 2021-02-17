import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:services_app/app/models/place_model.dart';
import 'package:services_app/app/repositories/place_repository_interface.dart';

part 'collect_controller.g.dart';

@Injectable()
class CollectController = _CollectControllerBase with _$CollectController;

abstract class _CollectControllerBase with Store {
  final IPlaceRepository repository;

  @observable
  ObservableStream<List<PlaceModel>> placeList;

  _CollectControllerBase(this.repository) {
    getList();
  }

  @action
  getList() {
    placeList = repository.reserveLocker(placeList).asObservable();
  }
}
