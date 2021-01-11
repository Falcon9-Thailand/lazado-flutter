import 'package:flutter/material.dart';
import 'package:naiban/services/fetchProducts.dart';
import 'package:naiban/views/detail/home/components/RecommandProducts.dart';
import 'package:naiban/models/Category.dart';

class DetailCategoryScreen extends StatefulWidget {
  final Category category;

  const DetailCategoryScreen({Key key, this.category}) : super(key: key);
  @override
  _DetailCategoryScreenState createState() => _DetailCategoryScreenState();
}

class _DetailCategoryScreenState extends State<DetailCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        title: Text(widget.category.category.toString() + ' ${category.id}'),
        actions: [],
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Products
              Container(
                width: size.width,
                child: FutureBuilder(
                  future: fetchProducts(),
                  builder: (context, snapshot) => snapshot.hasData
                      ? RecommandProducts(products: snapshot.data)
                      : Center(child: Image.asset("assets/ripple.gif")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
