import 'package:flutter/material.dart';
import 'package:naiban/views/homeScreen.dart';
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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/HomePage': (context) => HomeScreen(),
        '/Wellcome': (context) => Wellcome(),
        '/Register': (context) => RegisterScreen(),
        '/Login': (context) => LoginScreen(),
      },
      home: SpashScreen(),
    );
  }
}
