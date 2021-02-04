import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'collect_controller.dart';

class CollectPage extends StatefulWidget {
  const CollectPage({Key key}) : super(key: key);

  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends ModularState<CollectPage, CollectController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Aviso de coleta'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 200,
              child: Image(
                image: NetworkImage(
                    "https://www.limelocker.com.br/assets/images/logo-limelocker-linkedin-1-192x187.png"),
              ),
            ),
            flatButton("Clique para escanear QR Code do Locker"),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ou',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite o número do Locker',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {},
              elevation: 0,
              color: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                Modular.to.pushReplacementNamed('/place');
              },
              color: Colors.red,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                'Voltar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget flatButton(String text) {
  return FlatButton(
    padding: EdgeInsets.all(15.0),
    onPressed: () {},
    child: Text(
      text,
      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    ),
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green, width: 3.0),
        borderRadius: BorderRadius.circular(20.0)),
  );
}
