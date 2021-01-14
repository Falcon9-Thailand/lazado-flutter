import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void navigationLoginByEmailScreen() {
    Navigator.of(context).pushReplacementNamed('/LoginByEmailScreen');
  }

  void navigationLoginByPhoneNumberScreen() {
    Navigator.of(context).pushReplacementNamed('/LoginByPhoneNumberScreen');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
                  Container(
                    width: size.width,
                    height: size.height * 0.4,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      "assets/icons/login-icon.svg",
                      height: 180,
                      width: 180,
                    ),
                  ),
                  Form(
                    child: Column(
                      key: _formKey,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Text(
                            "LZADO",
                            style: TextStyle(
                                color: sTextTitle2Color, fontSize: 35),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: TextField(
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'เบอร์โทรศัพทร์ / อีเมล',
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.2),
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: RaisedButton(
                              color: sPrimaryColor,
                              onPressed: () {
                                navigationLoginByEmailScreen();
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                // if (_formKey.currentState.validate()) {

                                // If the form is valid, display a Snackbar.
                                //   Scaffold.of(context).showSnackBar(
                                //       SnackBar(content: Text('Login')));
                                // } else {
                                //   Scaffold.of(context).showSnackBar(SnackBar(
                                //       content: Text('กรุณากรอกข้อมูล')));
                                // }
                              },
                              child: Text(
                                'เข้าสู่ระบบ',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: sPrimaryColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SignInButtonBuilder(
                          height: 50,
                          icon: Icons.email,
                          text: "Ignored for mini button",
                          mini: true,
                          onPressed: () {},
                          backgroundColor: sPrimaryColor,
                        ),
                        SignInButtonBuilder(
                          height: 50,
                          icon: Icons.email,
                          text: "Ignored for mini button",
                          mini: true,
                          onPressed: () {},
                          backgroundColor: sPrimaryColor,
                        ),
                        SignInButtonBuilder(
                          height: 50,
                          icon: Icons.email,
                          text: "Ignored for mini button",
                          mini: true,
                          onPressed: () {},
                          backgroundColor: sPrimaryColor,
                        ),
                        SignInButtonBuilder(
                          height: 50,
                          icon: Icons.email,
                          text: "Ignored for mini button",
                          mini: true,
                          onPressed: () {},
                          backgroundColor: sPrimaryColor,
                        ),
                      ],
                    ),
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
