import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      //hide banner debug
      debugShowCheckedModeBanner: false,
      //home is statefullwidget
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //change status bar color
      statusBarColor: Colors.blue[200],
      //theme dark or light
      statusBarBrightness: Brightness.light,

    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Online'),
        backgroundColor: Colors.blue[200],
      ),
    );

  }
}
