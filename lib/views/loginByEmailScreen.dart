import 'package:flutter/material.dart';
import 'detail/login/components/imageLoginScreen.dart';
import 'loginByEmail/formPassword.dart';

class LoginByEmailScreen extends StatefulWidget {
  @override
  _LoginByEmailScreenState createState() => _LoginByEmailScreenState();
}

class _LoginByEmailScreenState extends State<LoginByEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  void navigationPageWel() {
    Navigator.of(context).pushReplacementNamed('/Wellcome');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
                  ImageLoginScreen(
                    size: size,
                    image: "assets/icons/password_loginscreen.svg",
                  ),
                  PasswordForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
