import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:services_app/app/models/place_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Selecione seu local'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () => _showDialog(context),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.placeList.hasError) {
          print(controller.placeList.error);
          return Center(
            child: RaisedButton(
              onPressed: controller.getList,
              child: Text('Error'),
            ),
          );
        }

        if (controller.placeList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<PlaceModel> list = controller.placeList.data;

        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              PlaceModel model = list[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListTile(
                  onTap: () {
                    Modular.to.pushReplacementNamed('/place');
                  },
                  title: Text(model.placeName),
                ),
              );
            });
      }),
    );
  }
}

_showDialog(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sua localização não está disponível'),
        content: Container(
          height: size.height * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Infelizmente não foi possível determinar sua posição atual. Digite o número QrCode do seu Armário:',
              ),
              TextField(
                decoration: InputDecoration(labelText: 'N° do Armário'),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
