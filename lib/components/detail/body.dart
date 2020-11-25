import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_online/model/product.dart';
import 'package:flutter_shop_online/utils/const.dart';
import 'package:flutter_svg/svg.dart';

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
            //stack parent
            child: Stack(
              children: [
                //box decoration white
                Container(
                  margin: EdgeInsets.only(
                    top: size.height * 0.35,
                  ),
                  padding: EdgeInsets.only(
                    top: size.height * 0.13,
                    left: paddingDefault / 2,
                    right: paddingDefault / 2,
                  ),
                  height: 500.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                      color: Colors.white,
                      //shadow for cardview
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.2, 0.2),
                          spreadRadius: 0.2,
                          blurRadius: 2,
                        ),
                      ]),


                  //detail product
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingDefault,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // linear color and size
                        ColorAndSize(product: product),

                        //description
                        Description(product: product),

                        //linear row count and like product
                        CountProductAndLikeButton(),

                        //linear cart and button buy now
                        AddProductToCart(product: product),
                      ],
                    ),
                  ),
                ),

                //text view title product
                ProductImageTitle(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddProductToCart extends StatelessWidget {
  const AddProductToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: paddingDefault,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //button add to card
          Container(
            width: 58,
            padding: EdgeInsets.all(4.0),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
              border: Border.all(
                color: product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: product.color,
              ),
              onPressed: () {
              },
            ),
          ),




          //button buy now
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: paddingDefault,
              ),
              height: 50,
              child: FlatButton(
                color: product.color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  18.0,
                )),
                onPressed: () {},
                child: Text(
                  'Buy Now'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CountProductAndLikeButton extends StatelessWidget {
  const CountProductAndLikeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CartCounter(),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            "assets/icons/heart.svg",
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

//linear title, price, image product
class ProductImageTitle extends StatelessWidget {
  const ProductImageTitle({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingDefault,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aristocratic Hand Bag',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),


          //title product
          Text(
            '${product.title}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),



          //row price and image product
          Row(
            children: [
              //text price
              RichText(
                text: TextSpan(
                    text: 'Price\n',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '\$${product.price}',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ]),
              ),



              SizedBox(
                width: paddingDefault,
              ),



              //image product
              Expanded(
                child: Hero(
                  tag: '${product.id}',
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//linear children 3 color
class ColorDot extends StatelessWidget {
  final Color colorDot;
  final bool isSelected;

  const ColorDot({
    Key key,
    this.colorDot,
    this.isSelected = false, //default select is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: paddingDefault / 2,
        right: paddingDefault / 2,
      ),
      padding: EdgeInsets.all(2.5),
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? colorDot : Colors.transparent,
        ),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorDot,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

//linear color and size
class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Color',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Row(
                children: [
                  ColorDot(
                    colorDot: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(
                    colorDot: Color(0xFFF8C078),
                  ),
                  ColorDot(
                    colorDot: Color(0xFFA29B9B),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
                text: 'Size\n',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                      text: '${product.size} cm',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ))
                ]),
          ),
        ),
      ],
    );
  }
}

//description
class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: paddingDefault,
      ),
      child: Text(
        '${product.description}',
        style: TextStyle(
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }
}

//linear control
class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1; //counter

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildButtonControl(
            icon: Icons.remove,
            press: () {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                });
              }
            }),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
            ),
          ),
        ),
        buildButtonControl(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            })
      ],
    );
  }

  //funtion create button sub, add
  SizedBox buildButtonControl({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
