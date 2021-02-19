import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:services_app/app/modules/collect/collect_module.dart';
import 'package:services_app/app/modules/place/place_module.dart';
import 'package:services_app/app/repositories/place_repository.dart';
import 'package:services_app/app/repositories/place_repository_interface.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:services_app/app/app_widget.dart';
import 'package:services_app/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IPlaceRepository>((i) => PlaceRepository(Firestore.instance)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/place', module: PlaceModule()),
        ModularRouter('/collect', module: CollectModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
