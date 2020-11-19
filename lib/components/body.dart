import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_online/utils/const.dart';

class BodyMain extends StatefulWidget {
  @override
  _BodyMainState createState() => _BodyMainState();
}

class _BodyMainState extends State<BodyMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingDefault),
          child: Text(
            'Women',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Category(),
      ],
    );
  }
}

//tab category list string
class Category extends StatefulWidget {
  //save pos selected category
  int posSelected = 0;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          //scroll horizontal (ngang)
          scrollDirection: Axis.horizontal,

          //list size
          itemCount: lsCategory.length,

          //builder listview
          itemBuilder: (context, index) => buildCategory(index)),
    );
  }

  Widget buildCategory(int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingDefault),
        child: Column(
          children: [
            Text(
              lsCategory[index],
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: textColorLight),
            ),
            Container(
              height: 2,
              width: 30,
              color: Colors.black87,
            ),
          ],
        ),
      );
}
