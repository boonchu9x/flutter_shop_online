import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/CanhLX.Hachinet/Desktop/Flutter/flutter_shop_online/lib/components/detail/detail_product.dart';
import 'package:flutter_shop_online/model/item_product.dart';
import 'package:flutter_shop_online/model/product.dart';
import 'package:flutter_shop_online/utils/const.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingDefault),
            child: Text(
              'Women',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Category(),

        //gridview
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.all(paddingDefault),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: paddingDefault,
                crossAxisSpacing: paddingDefault,
                crossAxisCount: 2, //số hàng
                childAspectRatio: 0.75, //tỉ lệ khung hình
              ),
              itemBuilder: (context, index) => ItemProduct(
                    product: products[index],
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            product: products[index],
                          ),
                        ),
                      );
                    },
                  )),
        ),
      ],
    );
  }
}

//tab category list string
class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

//listview
class _CategoryState extends State<Category> {
  //save pos selected category
  int posSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: paddingDefault),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
            //scroll horizontal (ngang)
            scrollDirection: Axis.horizontal,
            //list size
            itemCount: lsCategory.length,

            //builder listview
            itemBuilder: (context, index) => buildCategory(index)),
      ),
    );
  }

  Widget buildCategory(int index) => GestureDetector(
        onTap: () {
          setState(() {
            posSelected = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lsCategory[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: posSelected == index ? Colors.black : textColorLight,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: paddingDefault / 4),
                height: 2,
                width: 30,
                color: posSelected == index ? Colors.black : Colors.transparent,
              ),
            ],
          ),
        ),
      );
}
