import 'package:flutter/material.dart';
import 'package:naiban/themes/color_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: sPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: sSucctionColor,
          ),
          onPressed: null,
        ),
        title: Text(
          "LAZADO",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: sSucctionColor,
              ),
              onPressed: null)
        ],
      ),
    );
  }
}
