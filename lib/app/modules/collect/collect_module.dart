import 'collect_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'collect_page.dart';

class CollectModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CollectController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => CollectPage()),
      ];

  static Inject get to => Inject<CollectModule>.of();
}
