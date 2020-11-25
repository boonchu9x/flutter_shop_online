import 'package:flutter/material.dart';
import 'package:flutter_shop_online/model/product.dart';
import 'package:flutter_shop_online/utils/const.dart';

class ItemProduct extends StatelessWidget {
  //parameter
  final Product product;
  final Function press;

  const ItemProduct({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(paddingDefault),
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(10.0)),

              //image item product
              child: Hero(
                tag: '${product.id}',
                child: Image.asset(product.image),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            product.title,
            style: TextStyle(
              fontSize: 16.0,
              color: textColorLight,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            '\$${product.price}',
            style: TextStyle(
              fontSize: 16.0,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
