import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trydan_internapp/screens/otp_screen.dart';

const titlecolor = Color(0xFF4293f5);
const fontcolor = const Color(0xFFb3b3b3);
class loginscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loginscreenstate();
  }
}

class loginscreenstate extends State<loginscreen> {

TextEditingController mobileno = TextEditingController();

var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: width,
        height: height,

        child: ListView(children: <Widget>[

          Stack(
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
                    height: 330.0,
                    color: titlecolor,
                    child: Column( mainAxisAlignment: MainAxisAlignment.center,
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
                        SizedBox(height: 80,),
                        Row(children: <Widget>[

                          SizedBox(width: 85,), Text('Enter your',style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 25

                          ),textAlign: TextAlign.left,),

                        ],),
                        Row(children: <Widget>[

                          SizedBox(width: 85,), Text('mobile number',style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 25

                          ),textAlign: TextAlign.left,),

                        ],)
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                  margin: EdgeInsets.only(top: height/1.85,left:width/14),
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[

                        SizedBox(width: 20,),
                        Text("You will get a code via sms",style: TextStyle(
                            fontWeight: FontWeight.bold
                            ,
                            color: fontcolor
                        ),textAlign: TextAlign.left,)
                      ],
                    ),
                    SizedBox(height: 20,)
                    ,  Row(
                      children: <Widget>[

                        SizedBox(width: 20,),
                        Text("India (+91)",style: TextStyle(
                            fontWeight: FontWeight.bold
                            ,
                            color: fontcolor
                        ),textAlign: TextAlign.left,)
                      ],
                    ),


                    Padding(
                        padding: EdgeInsets.only(left:20,right: 60),
                        child: Form(
                            key: key,

                            child: TextFormField(

                              inputFormatters:[
                                LengthLimitingTextInputFormatter(10),
                              ],
                              controller: mobileno,
                              keyboardType: TextInputType.number,
                              validator: (value)
                              {
                                if (value=="" || value.length>10 || value.length<10 || value== " "){

                                  return 'Invalid Mobile Number';
                                }
                              },
                              decoration: InputDecoration(

                                  errorStyle: TextStyle(

                                      color: Colors.red,
                                      fontSize: 12

                                  ),

                                  hintText: "9876543210",
                                  hintStyle: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 20
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: fontcolor,

                                      )
                                  )
                              ),
                            ))
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 12,left: 100),
                        child: RaisedButton(
                          elevation: 10,
                          onPressed: () {
                            setState(() {


                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return OtpPage();
                              }));
                            });
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xFF4293f5)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Container(
                                constraints: BoxConstraints(maxWidth: 84.0, minHeight: 45.0),
                                alignment: Alignment.center,
                                child:Row(children: <Widget>[

                                  Text(
                                    "    Login",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,

                                  )

                                ],)
                            ),
                          ),
                        )

                    )




                  ],) )

            ],
          ),

        ],)
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-60);
    path.quadraticBezierTo(size.width / 4, size.height,
        size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width /4), size.height,
        size.width, size.height - 105);
    path.lineTo(size.width, 2.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}