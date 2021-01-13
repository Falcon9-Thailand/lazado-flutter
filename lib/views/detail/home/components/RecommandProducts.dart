import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naiban/models/Products.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:naiban/views/detail/product/ProductDetailScreen.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key key,
    this.products,
  }) : super(key: key);
  // Because our Api provie us list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleBodyFont = TextStyle(
        fontFamily: 'RUS', fontSize: 16, fontWeight: FontWeight.normal);
    TextStyle textStyleBodyFontPrice = TextStyle(
        fontFamily: 'RUS',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.red);
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10), //20
        child: GridView.builder(
          // We just turn off grid view scrolling
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // just for demo
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 0.73,
          ),
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: Offset(0, 2))
                ]),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailScreen(
                                      products: products[index],
                                    ))),
                        child: Container(
                          // color: Colors.red,
                          // margin: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Image.network(
                            products[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                            height: 105,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(products[index].title,
                                    style: textStyleBodyFont),
                                Text(products[index].price.toString() + '฿',
                                    style: textStyleBodyFontPrice)
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 105,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            width: 80,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: sPrimaryColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              color: sPrimaryColor,
                            ),
                            child: Text(
                              "ซื้อ",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'RUS'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        color: Colors.red,
                        child: IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/heart.svg",
                            height: 18,
                            color: Colors.white,
                          ),
                          onPressed: () => null,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        color: sPrimaryColor,
                        child: IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/bag.svg",
                            height: 18,
                            color: Colors.white,
                          ),
                          onPressed: () => null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
