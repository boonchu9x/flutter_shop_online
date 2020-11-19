import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      statusBarColor: Colors.grey,
      //theme dark or light
      statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //toolbar

        //back button
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {},
        ),

        actions: <Widget>[
          IconButton(icon: SvgPicture.asset(""), onPressed: null)
        ],
      ),
    );
  }
}
