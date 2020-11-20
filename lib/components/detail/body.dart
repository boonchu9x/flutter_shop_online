import 'package:flutter/material.dart';
import 'package:flutter_shop_online/model/product.dart';

class BodyDetail extends StatelessWidget {
  final Product product;

  const BodyDetail({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get screen size
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          //2 component height = height_screen /2
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
