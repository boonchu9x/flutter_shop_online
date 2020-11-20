import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///C:/Users/CanhLX.Hachinet/Desktop/Flutter/flutter_shop_online/lib/components/main/body.dart';
import 'package:flutter_shop_online/utils/const.dart';
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
      //statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      //toolbar

      //back button
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: textColor,
        ),
        onPressed: () {
          SystemNavigator.pop(); //Exit app
        },
      ),

      //search icon
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: textColor,
          ),
          onPressed: () {},
        ),

        //cart icon
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: textColor,
          ),
          onPressed: () {},
        ),

        //space between search icon & cart icon
        SizedBox(
          width: paddingDefault / 2,
        )
      ],
    );
  }
}
