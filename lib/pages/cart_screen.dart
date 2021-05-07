import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vx.gray200,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: VStack([
          "My Cart".text.xl3.bold.make().px16(),
          20.heightBox,
          VStack([
            ProductTile(
                asset: 'assets/shoes.jpg',
                price: '\$100',
                title: 'Red Nike Shoes'),
            ProductTile(
                asset: 'assets/shirt.jpg',
                price: '\$70',
                title: 'Casual Shirt'),
            ProductTile(
                asset: 'assets/sunglasses.jpg',
                price: '\$50',
                title: 'Ray Ban Sunglasses'),
          ]).scrollVertical().h(context.percentHeight * 52),
          VxBox(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Subtotal".text.white.normal.lg.make(),
                  "\$220.0".text.white.lg.semiBold.make()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Tax and fees".text.white.normal.lg.make(),
                  "\$5.0".text.white.lg.semiBold.make()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Delivery".text.white.normal.lg.make(),
                  "\$0.0".text.white.lg.semiBold.make()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Total".text.uppercase.white.semiBold.lg.make(),
                  "\$225.0".text.white.lg.semiBold.make()
                ],
              ),
              FlatButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: "Checkout".text.uppercase.xl.black.make().py12())
                  .w(double.infinity)
                  .cornerRadius(10.0)
            ],
          ))
              .p20
              .withDecoration(BoxDecoration(
                  color: Vx.orange500,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))))
              .make()
              .w(double.infinity)
              .expand()
        ]));
  }
}

class ProductTile extends StatefulWidget {
  final String price;
  final String asset;
  final String title;
  ProductTile(
      {@required this.asset, @required this.price, @required this.title});
  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
            elevation: 5.0,
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              widget.asset,
              width: context.percentWidth * 35,
              height: context.percentWidth * 35,
              fit: BoxFit.cover,
            )).cornerRadius(10.0),
        20.widthBox,
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          widget.price.text.lg.bold.orange500.make(),
          widget.title.text.black.lg.bold.make(),
          10.heightBox,
          Material(
            clipBehavior: Clip.antiAlias,
            elevation: 5.0,
            child: Row(
              children: [
                VxBox(child: "-".text.lg.bold.make())
                    .alignCenter
                    .white
                    .size(30, 30)
                    .make(),
                VxBox(child: "1".text.lg.bold.make())
                    .alignCenter
                    .gray300
                    .size(30, 30)
                    .make(),
                VxBox(child: "+".text.lg.bold.make())
                    .alignCenter
                    .white
                    .size(30, 30)
                    .make()
              ],
            ),
          ).cornerRadius(10.0)
        ]).py16()
      ],
    ).py(6).px16();
  }
}
