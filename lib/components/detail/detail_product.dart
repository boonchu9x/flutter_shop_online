import 'package:flutter/material.dart';
import 'package:flutter_shop_online/components/detail/body.dart';
import 'package:flutter_shop_online/model/product.dart';
import 'package:flutter_shop_online/utils/const.dart';
import 'package:flutter_svg/svg.dart';

//màn hình chi tiết sản phẩm
class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0.0,
        //toolbar

        //back button
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        //search icon
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.white,
            ),
            onPressed: () {},
          ),

          //cart icon
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: Colors.white,
            ),
            onPressed: () {},
          ),

          //space between search icon & cart icon
          SizedBox(
            width: paddingDefault / 2,
          )
        ],
      ),
      body: BodyDetail(product: product,),
    );
  }
}
