import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trydan_internapp/screens/login_screen.dart';

const titlecolor = Color(0xFF3259a8);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {

    super.initState();
    _controller = AnimationController(vsync: this,
        duration: Duration(seconds: 3));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    Future.delayed(const Duration(seconds:3), () {
      setState(() {
        Navigator.push(context, PageTransition(type: PageTransitionType.upToDown, child: loginscreen()));

        // Here you can write your code for open new view
      });
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      backgroundColor: titlecolor,

        body: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Card(child: Container(


                  width: 200.0,

                  child: Image.asset("images/logo.png"),
                ),),
                SizedBox(height: 70.0,),
                Row(
                  children: <Widget>[
                    Expanded( child: Shimmer.fromColors(
                      baseColor: Color(0xFF4293f5),
                      highlightColor:  Color(0xff64B6FF),
                      child: Text("TyDan GO!", textAlign: TextAlign.center,
                        style:  TextStyle(
                          fontSize: 24.0,
color: Colors.white,

                          fontWeight: FontWeight.bold,

                        ),),
                    ), )
                  ],
                ),

                SizedBox(height: 10.0),
                Text("",
                  style:  TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,

                      color: Colors.blue
                  ),),



              ],
            ),
          ),
        )
    );
  }
}