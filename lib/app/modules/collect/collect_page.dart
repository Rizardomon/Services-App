import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:services_app/app/models/place_model.dart';
import 'collect_controller.dart';

class CollectPage extends StatefulWidget {
  const CollectPage({Key key}) : super(key: key);

  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends ModularState<CollectPage, CollectController> {
  //use 'controller' variable to access controller

  String qrCode = '';
  PlaceModel model;
  var txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Aviso de coleta'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
              FlatButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () {
                  scanQRCode();
                },
                child: Text(
                  'Escaneie o QRcode indicado',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value) => qrCode = value,
                  controller: txt,
                  decoration: InputDecoration(
                    labelText: 'Digite o número do Locker',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  // Modular.to.pushReplacementNamed('/place');
                  controller.repository.reserveLocker(model);
                },
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
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
        txt.text = qrCode;
        controller.repository.reserveLocker(model);
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
