import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trydan_internapp/screens/login_screen.dart';
import 'package:trydan_internapp/screens/main_screen.dart';
import 'package:trydan_internapp/screens/otp_screen.dart';
import 'package:trydan_internapp/screens/signup_screen.dart';
import 'package:trydan_internapp/screens/splashscreen.dart';


const titlecolor = Color(0xFF3259a8);


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]);
    return MaterialApp(
      title: 'TryDan Go!',
      theme: ThemeData(



        primarySwatch: Colors.blue,
      ),
      home: mainscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

