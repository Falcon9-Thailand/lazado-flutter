import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginByPhoneNumberScreen extends StatefulWidget {
  @override
  _LoginByPhoneNumberScreenState createState() =>
      _LoginByPhoneNumberScreenState();
}

class _LoginByPhoneNumberScreenState extends State<LoginByPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: Colors.red,
        )
      ],
    );
  }
}
