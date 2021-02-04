import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'collect_controller.g.dart';

@Injectable()
class CollectController = _CollectControllerBase with _$CollectController;

abstract class _CollectControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
