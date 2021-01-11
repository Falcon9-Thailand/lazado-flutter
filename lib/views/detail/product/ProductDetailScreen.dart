import 'package:flutter/material.dart';
import 'package:naiban/models/Products.dart';
import 'package:naiban/themes/color_app.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product products;

  const ProductDetailScreen({Key key, this.products}) : super(key: key);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 250,
              child: Image.network(
                widget.products.image,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.products.title,
                      style: textStyleFontHead,
                    ),
                    Text(
                      widget.products.price.toString() + '฿',
                      style: textStyleFontPriceHead,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              // color: Colors.blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        offset: Offset(0, 2))
                  ]),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'RSU',
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.products.price.toString() + '฿',
                        style: textStyleFontPriceHead,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: 80,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: sPrimaryColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: sPrimaryColor,
                        ),
                        child: Text(
                          "ซื้อ",
                          style:
                              TextStyle(color: Colors.white, fontFamily: 'RUS'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              // color: Colors.yellowAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "รายละเอียด",
                      style: textStyleFontHead,
                    ),
                    Text(
                      widget.products.description,
                      style: textStyleFontBody,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
