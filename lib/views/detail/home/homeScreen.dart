import 'package:flutter/material.dart';
import 'package:naiban/models/Products.dart';
import 'package:naiban/services/fetchCategorys.dart';
import 'package:naiban/services/fetchProducts.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:naiban/views/detail/category/CategoryScreen.dart';
import 'package:naiban/views/loginScreen.dart';
import 'package:naiban/views/registerScreen.dart';

import 'components/RecommandProducts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List catigory = [
    "คุ้มค่าที่สุด",
    "สินค้าขายดี",
    "ยอดนิยม",
    "ข่าวสาร",
    "จำนวนจำกัด"
  ];
  bool currentuser = false; // check user login
  bool isActive = false;
  int isSelectIndex = 0;
  Product product;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      appBar: currentuser != false
          ? buildAppBar(_globalKey)
          : buildAppBarNotAuth(_globalKey),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // list menu
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                alignment: Alignment.center,
                width: size.width,
                height: 40,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        catigory.length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(catigory[index],
                                    style: isSelectIndex == index
                                        ? textStyleActive
                                        : textStyleNoActive),
                              ),
                            )),
                  ),
                ),
              ),
              // Catigory Products
              Container(
                child: FutureBuilder(
                  future: fetchCategory(),
                  builder: (context, snapshot) => snapshot.hasData
                      ? CategoryScreen(category: snapshot.data)
                      : Center(child: Image.asset("assets/ripple.gif")),
                ),
              ),
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
      drawer: Drawer(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }

  AppBar buildAppBar(_globalKey) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Lazado",
        style: TextStyle(
            fontFamily: 'RUS', fontSize: 19, fontWeight: FontWeight.bold),
      ),
      leading: new IconButton(
        icon: new Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () => _globalKey.currentState.openDrawer(),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: sTextTitleColor),
          onPressed: () => null,
        ),
        Container(
          alignment: Alignment.center,
          child: Stack(children: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: sTextTitleColor),
              onPressed: () => null,
            ),
          ]),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  AppBar buildAppBarNotAuth(_globalKey) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Lazado",
        style: TextStyle(
            fontFamily: 'RUS', fontSize: 19, fontWeight: FontWeight.bold),
      ),
      leading: new IconButton(
        icon: new Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () => _globalKey.currentState.openDrawer(),
      ),
      actions: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen())),
                child: Container(
                  alignment: Alignment.center,
                  width: 55,
                  height: 20,
                  child: Text(
                    "เข้าสู่ระบบ",
                    style: TextStyle(
                      fontFamily: 'RSU',
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => RegisterScreen())),
                child: Container(
                  alignment: Alignment.center,
                  width: 55,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Text(
                    "สมัครสมาชิก",
                    style: TextStyle(
                      fontFamily: 'RSU',
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
