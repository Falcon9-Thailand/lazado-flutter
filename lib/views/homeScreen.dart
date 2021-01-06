import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naiban/themes/color_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstHalf;
  String secondHalf;
  bool flag = true;
  String titleText = "น้ำยาล้างจาน แกลลอน 3.6 ลิตร ซันไลต์";
  @override
  void initState() {
    super.initState();
    if (titleText.length > 15) {
      firstHalf = titleText.substring(0, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: sPrimaryColor,
      body: BodyHomeScreen(size: size, firstHalf: firstHalf),
    );
  }
}

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    Key key,
    @required this.size,
    @required this.firstHalf,
  }) : super(key: key);

  final Size size;
  final String firstHalf;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AppbarHomeScreen(size: size),
          ContentHomeScreen(size: size, firstHalf: firstHalf),
          GetSeachBox(size: size),
        ],
      ),
    );
  }
}

class ContentHomeScreen extends StatelessWidget {
  const ContentHomeScreen({
    Key key,
    @required this.size,
    @required this.firstHalf,
  }) : super(key: key);

  final Size size;
  final String firstHalf;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: size.width,
          height: size.height * 0.7,
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 25, right: 25),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: size.width,
                        height: size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => CardItemProducts(
                              size: size, firstHalf: firstHalf),
                        ),
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 25, right: 25),
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
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: size.width,
                        height: size.height * 0.3,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: size.width * .3,
                                    height: size.height,
                                    // color: Colors.green,
                                    child: SvgPicture.asset(
                                        "assets/icons/first.svg"),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: size.height,
                                  color: sTextTitle2Color.withOpacity(0.5),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "20.00฿",
                                        style: TextStyle(
                                          color: sTextTitle2Color,
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppbarHomeScreen extends StatelessWidget {
  const AppbarHomeScreen({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.3,
      color: sPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/menu.svg",
                    height: 18,
                    color: Colors.white,
                  ),
                  onPressed: () => print("เมนู"),
                ),
                Row(
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
                    )
                  ],
                )
              ],
            )
          ],
        ),
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
      padding: const EdgeInsets.only(left: 25, top: 25, right: 10, bottom: 20),
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

class GetSeachBox extends StatelessWidget {
  const GetSeachBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      top: 170,
      height: 40,
      child: Container(
        height: 40,
        width: size.width * 0.7,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/icons/search.svg",
                height: 15,
              ),
              // SvgPicture.asset(
              //   "assets/icons/filter.svg",
              //   height: 15,
              // ),
            ],
          ),
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
