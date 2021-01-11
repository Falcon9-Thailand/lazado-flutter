import 'package:flutter/material.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:naiban/views/detail/category/CategoryScreen.dart';
import 'package:naiban/views/detail/home/homeScreen.dart';
import 'package:naiban/views/loginScreen.dart';
import 'package:naiban/views/registerScreen.dart';
import 'package:naiban/views/splashScreen.dart';
import 'package:naiban/views/wellcomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: sPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'RSU'),
      initialRoute: '/',
      routes: {
        '/HomePage': (context) => HomeScreen(),
        '/Wellcome': (context) => Wellcome(),
        '/Register': (context) => RegisterScreen(),
        '/Login': (context) => LoginScreen(),
        '/Category': (context) => CategoryScreen(),
      },
      home: SpashScreen(),
    );
  }
}
