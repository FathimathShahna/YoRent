import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/PROVIDER/loginprovider.dart';
import 'package:yorent/USER/home.dart';

import '../CONSTANT/mycolor.dart';
import '../CONSTANT/mywidget.dart';
import 'bottomnavigation_screen.dart';

class otp extends StatelessWidget {
  const otp({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width,
      decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/login.png"),fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: height/3,),

                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: TXT('ENTER OTP', green3, 45),
                ),
                Consumer<LoginProvider>(
                  builder: (context,value,child) {
                    return Pinput(
                        controller:value.otpController,
                        length: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        defaultPinTheme: PinTheme(
                            textStyle:
                            TextStyle(fontWeight: FontWeight.bold),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration( color:Color(0xffFDFDFD).withOpacity(.40),boxShadow: [
                              // BoxShadow(
                              //
                              //   blurRadius: 1.0, // soften the shadow
                              //   spreadRadius: 1.0, //extend the shadow
                              // ),
                            ], borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 0,
                                   // color:green2
                                    //withOpacity(0.9)
                    ))),

                        onCompleted: (pin){
                          value.verify(context,);

                        },
                    );
                  }
                ),
                SizedBox(height: 15,),
               //
                // Text('Resend OTP in 30 sec',style: TextStyle(color: Colors.white,fontSize: 18),),
                SizedBox(height: 25,),
                InkWell(
                    onTap: (){
                     // callNext(context, Bottombar());
                    },
                    child: mybtn(50, 170, 'Submit', green2, 25, FontWeight.normal, white, 'jml'))

              ],
            ),
          ),
        ),
      ),


    );
  }
}
