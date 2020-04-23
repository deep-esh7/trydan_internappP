import 'package:flutter/material.dart';
import 'package:trydan_internapp/screens/login_screen.dart';
import 'package:trydan_internapp/screens/signup_screen.dart';


const titlecolor = Color(0xFF4293f5);

class mainscreen extends StatefulWidget {
  mainscreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  mainscreenstate createState() => mainscreenstate();
}

class mainscreenstate extends State<mainscreen> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xffffffff),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child:ClipPath(
              clipper: ClippingClass(),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: height/1.60,
                color: titlecolor,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left:1.5,right:3.5),

                        child: Image.asset("images/logo.png",width: 200,),
                      ),




                    )
,

                  ],
                ),


              ),



            ),
          ),


    Container(
    margin: EdgeInsets.only(top: height/1.50,left:width/14),
    child: Column(
    children: <Widget>[

    ButtonTheme(
      buttonColor: Colors.white,

    minWidth: 300.0,
    height: 60.0,
    child: RaisedButton(


onPressed: () {


  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return signupscreen();
  }));

},



    child: Text("CREATE ACCOUNT",style: TextStyle(
      color: Colors.blue,
      fontSize: 20
    ),),

      shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: Colors.blue))

    ),
    ),

SizedBox(height: 25,),
      ButtonTheme(
        buttonColor: Colors.blue,

        minWidth: 300.0,
        height: 60.0,
        child: RaisedButton(


            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return loginscreen();
              }));

            },



            child: Text("LOGIN",style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),),

            shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(40),
                side: BorderSide(color: Colors.white))

        ),
      )

    ],
    ))


        ],
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-80);
    path.quadraticBezierTo(size.width / 4, size.height,
        size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
