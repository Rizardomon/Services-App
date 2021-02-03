import 'package:flutter/material.dart';
import 'package:services_app/src/views/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Services App',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
