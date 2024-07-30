import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mycolor.dart';
import 'package:yorent/PROVIDER/loginprovider.dart';
import 'package:yorent/USER/home.dart';


import 'getstrt.dart';

class Splash extends StatefulWidget {
  const
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    FirebaseAuth auth = FirebaseAuth.instance;
    var LoginUser = auth.currentUser;
    LoginProvider provider= Provider.of<LoginProvider>(context,listen: false);
    Timer( Duration(seconds: 3), () {
      if (LoginUser==null){
     callNextReplacement(context, starting());
      }
      else{
       provider.userAuthorisation(LoginUser.phoneNumber!, context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;


    return Scaffold(

        body:Container(
          height: height,
          width: width,
          color: green2,
          child: Center(
            child: RichText(text:   TextSpan(
                text: 'YO!',style: TextStyle(
                fontSize: 40,fontWeight: FontWeight.w900,color:white,
                fontFamily:'f1'
            ),
                children:
                <TextSpan>[
                  TextSpan(text: ' Rent',style: TextStyle(
                      fontWeight: FontWeight.w900,fontSize: 40,
                      color: white,fontFamily:'f2'

                  ))
                ]

            )),
          ),
          //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/gown.jpeg"),fit: BoxFit.fill)),
        ),


    );
  }
}




