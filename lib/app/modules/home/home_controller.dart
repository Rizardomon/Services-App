import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:services_app/app/models/place_model.dart';
import 'package:services_app/app/repositories/place_repository_interface.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IPlaceRepository repository;

  @observable
  ObservableStream<List<PlaceModel>> placeList;

  _HomeControllerBase(this.repository) {
    getList();
  }

  @action
  getList() {
    placeList = repository.getPlaces().asObservable();
  }

  // Future save(TodoModel model) => repository.save(model);

  // Future removeEntry(TodoModel model) => repository.removeEntry(model);

  // Future logoff() async {
  //   await Modular.get<AuthController>().logout();
  //   Modular.to.pushReplacementNamed('/');
  // }
}
