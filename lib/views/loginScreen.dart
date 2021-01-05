import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naiban/themes/color_app.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: sPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: Colors.white,
            ),
            Container(
              width: size.width,
              height: size.height * 0.3,
              color: sPrimaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/menu.svg",
                            height: 20,
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
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
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: Text(
                                  "สมัครสมาชิก",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.7,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ],
            ),
            Positioned(
                left: 50,
                top: 170,
                height: 40,
                child: Container(
                  height: 40,
                  width: size.width * 0.7,
                  color: Colors.white,
                  child: TextFormField(),
                )),
          ],
        ),
      ),
    );
  }
}
