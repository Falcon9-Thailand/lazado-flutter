import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Wellcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Wellcome 1",
            style: TextStyle(
                fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
