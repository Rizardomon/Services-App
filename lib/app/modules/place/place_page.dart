import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'place_controller.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key key}) : super(key: key);

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends ModularState<PlacePage, PlaceController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Selecione o serviço desejado'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: ListTile(
              onTap: () {},
              title: Text(
                'Lime Clean',
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
