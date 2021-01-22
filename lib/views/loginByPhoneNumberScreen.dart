import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naiban/themes/color_app.dart';

import 'detail/login/components/imageLoginScreen.dart';
import 'loginByPhonenumber/components/formOtp.dart';

class LoginByPhoneNumberScreen extends StatefulWidget {
  @override
  _LoginByPhoneNumberScreenState createState() =>
      _LoginByPhoneNumberScreenState();
}

class _LoginByPhoneNumberScreenState extends State<LoginByPhoneNumberScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void navigatorBack() {
    FocusScope.of(context).requestFocus(FocusNode());
    // Navigator.of(context).pushReplacementNamed("/HomePage");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          // alignment: Alignment.center,
          // margin: EdgeInsets.all(8),
          // width: 30,
          // height: 30,
          // decoration: BoxDecoration(
          //     color: Colors.orange[50],
          //     border: Border.all(color: Colors.orange[200], width: 1),
          //     borderRadius: BorderRadius.circular(10)),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () => navigatorBack()),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageLoginScreen(
                    size: size,
                    image: "assets/icons/password_loginscreen.svg",
                  ),
                  OtpForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
