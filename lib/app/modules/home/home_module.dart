import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:services_app/app/modules/place/place_module.dart';
import 'package:services_app/app/repositories/place_repository.dart';
import 'package:services_app/app/repositories/place_repository_interface.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind<IPlaceRepository>(
            (i) => PlaceRepository(FirebaseFirestore.instance)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/place', module: PlaceModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
