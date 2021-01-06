import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naiban/themes/color_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstHalf;
  String firstHalf2;
  String secondHalf;
  bool currentuser = true;
  String titleText = "น้ำยาล้างจาน แกลลอน 3.6 ลิตร ซันไลต์";
  String titleText2 = "น้ำยาล้างจาน แกลลอน 3.6 ลิตร ซันไลต์";
  @override
  void initState() {
    super.initState();
    currentuser = false;
    if (titleText.length > 15) {
      firstHalf = titleText.substring(0, 10);
    }
    if (titleText2.length > 15) {
      firstHalf2 = titleText.substring(0, 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: sPrimaryColor,
      body: BodyHomeScreen(
        size: size,
        firstHalf: firstHalf,
        firstHalf2: firstHalf2,
        currentuser: currentuser,
      ),
    );
  }
}

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    Key key,
    @required this.size,
    @required this.firstHalf,
    this.currentuser,
    this.firstHalf2,
  }) : super(key: key);

  final Size size;
  final String firstHalf;
  final String firstHalf2;
  final bool currentuser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sSucctionColor,
      appBar: currentuser
          ? buildAppBarCurrentUserHomeScreen()
          : buildAppBarHomeScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ContentHomeScreen(size: size, firstHalf: firstHalf),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBarHomeScreen() {
    return AppBar(
      backgroundColor: sPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          height: 18,
          color: Colors.white,
        ),
        onPressed: () => print("เมนู"),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: size.width * 0.21,
              height: size.height * .03,
              child: InkWell(
                onTap: () => print("เข้าสู่ระบบ"),
                child: Text(
                  "เข้าสู่ระบบ",
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ),
            InkWell(
              onTap: () => print("สมัครสมาชิก"),
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.21,
                height: size.height * .03,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Text(
                  "สมัครสมาชิก",
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ),
            SizedBox(width: 15)
          ],
        )
      ],
    );
  }

  AppBar buildAppBarCurrentUserHomeScreen() {
    return AppBar(
      backgroundColor: sPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          height: 18,
          color: Colors.white,
        ),
        onPressed: () => print("เมนู"),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => print("สมัครสมาชิก"),
              child: Container(
                height: 35,
                width: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/user.svg",
                    height: 25,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(width: 15)
          ],
        )
      ],
    );
  }
}

class ContentHomeScreen extends StatelessWidget {
  const ContentHomeScreen({
    Key key,
    @required this.size,
    @required this.firstHalf,
    this.firstHalf2,
  }) : super(key: key);

  final Size size;
  final String firstHalf;
  final String firstHalf2;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "สินค้าแนะนำ",
                  style: TextStyle(color: sTextTitleColor, fontSize: 12),
                ),
                Text(
                  "ดูทั้งหมด",
                  style: TextStyle(color: sTextTitle2Color, fontSize: 12),
                ),
              ],
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: size.width,
                  height: size.height * 0.28,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        CardItemProducts(size: size, firstHalf: firstHalf),
                  ),
                )
              ]),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "สินค้าขายดี",
                  style: TextStyle(color: sTextTitleColor, fontSize: 12),
                ),
                Text(
                  "ดูทั้งหมด",
                  style: TextStyle(color: sTextTitle2Color, fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: size.height,
              width: size.width,
              // color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(20),
                  width: size.width * 0.6,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: size.width * .4,
                          height: size.height,
                          // color: Colors.green,
                          child: SvgPicture.asset("assets/icons/first.svg"),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: size.height,
                        color: sTextTitle2Color.withOpacity(0.5),
                      ),
                      Container(
                        width: size.width * .41,
                        height: size.height,
                        // color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: size.width * 0.2,
                                height: size.height,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      firstHalf + 'าน สะอาด',
                                      style: TextStyle(
                                          color: sTextTitle2Color,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          Icons.star,
                                          color: Colors.orangeAccent,
                                          size: 7,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 7,
                                          color: sTextTitleColor,
                                        ),
                                        Text(
                                          " ตำแหน่ง",
                                          style: TextStyle(
                                              color: sTextTitleColor,
                                              fontSize: 7),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      " 45.00฿",
                                      style: TextStyle(
                                          color: sTextTitleColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " 25.00฿",
                                      style: TextStyle(
                                          color: sTextTitle2Color,
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: size.width * 0.12,
                                height: size.height,
                                // color: Colors.red,
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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

class CardItemProducts extends StatelessWidget {
  const CardItemProducts({
    Key key,
    @required this.size,
    @required this.firstHalf,
  }) : super(key: key);

  final Size size;
  final String firstHalf;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 5, bottom: 7),
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              width: size.width,
              height: 90,
              child: SvgPicture.asset("assets/icons/first.svg"),
            ),
            Divider(
              color: sTextTitle2Color,
            ),
            GetTitleText(titleText: firstHalf),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 7,
                      ),
                    ),
                  ),
                  GetTextLocation(
                    textLocation: "กรุงเทพ",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetTextLocation extends StatelessWidget {
  const GetTextLocation({
    Key key,
    this.textLocation,
  }) : super(key: key);
  final textLocation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          textLocation.toString(),
          style: TextStyle(
              color: sTextTitle2Color,
              fontSize: 7,
              fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}

class GetTitleText extends StatelessWidget {
  const GetTitleText({
    Key key,
    this.titleText,
  }) : super(key: key);
  final titleText;
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText + '...',
            style: TextStyle(
                color: sTextTitle2Color,
                fontSize: 7,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "45.50฿",
                style: TextStyle(
                    color: sTextTitleColor,
                    fontSize: 7,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 2,
              ),
              Text("20.00฿",
                  style: TextStyle(
                    color: sTextTitle2Color,
                    fontSize: 7,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
