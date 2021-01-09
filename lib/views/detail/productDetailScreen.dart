import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naiban/themes/color_app.dart';

class ProductDetailScreen extends StatelessWidget {
  final product;
// Thats means we have to  pass it
  const ProductDetailScreen({Key key, @required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sPrimaryColor,
      appBar: buildAppBar(context),
      body: Container(
        child: Center(child: Text(product.toString())),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
