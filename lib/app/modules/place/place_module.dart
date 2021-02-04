import 'package:flutter_modular/flutter_modular.dart';
import 'package:services_app/app/modules/place/place_page.dart';

import 'place_controller.dart';

class PlaceModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PlaceController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PlacePage()),
      ];

  static Inject get to => Inject<PlaceModule>.of();
}
