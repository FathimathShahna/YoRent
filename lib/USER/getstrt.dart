import 'package:flutter/material.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mycolor.dart';

import 'login.dart';

class starting  extends StatelessWidget {
     starting({super.key,});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.width;
    var width=MediaQuery.of(context).size.width;

    return  SafeArea(
      child: Scaffold(
        body:
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff677C33),


                    // height: ,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60,right: 40,top: 30),
                      child: Column(
                        children: [
                          Container(
                            height: 240,
                            width: 190,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(90),
                                  topRight: Radius.circular(90),

                                ),
                                image: DecorationImage(
                                  image: AssetImage("assets/img.png"),
                                  fit: BoxFit.cover,
                                )
                            ),

                          ),

                          Text("   the best place to find \n    "
                              "  a wedding dress",style: TextStyle(
                                color: green1,
                                fontFamily: 'Sacramento',
                                fontSize: 30),),
                        ],
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top: 368,left: 200),
                      child: InkWell(
                        onTap: (){
                         callNext(context, login());
                        },
                        child: Container(
                          height: 40,
                          width: 150,

                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
                          child: Center(
                            child: Text("Get Started",style: TextStyle(fontFamily: 'n1',color: Colors.white,
                            fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding:  EdgeInsets.only(top: 480),
                      child: Container(
                        padding: EdgeInsets.only(top: 100),
                        height: 135,
                          width: 175,

                        color: Color(0xff88A83A),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 190,top: 435),
                      child: Container(
                        height: 180,
                        width: 185,
                        decoration: BoxDecoration(color: Colors.blue,
                        image: DecorationImage(image: AssetImage("assets/download (4).jpg"),
                        fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 495,left: 100),
                      child: Image.asset('assets/Ellipse 1.png'),
                    ),
                  ],
                ),



              ],
            ),



        
        


      ),
    );
  }
}
