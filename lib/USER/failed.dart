import 'package:flutter/material.dart';

import '../CONSTANT/callFunctions.dart';
import '../CONSTANT/mycolor.dart';
import 'home.dart';

class failed extends StatelessWidget {
  const failed({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height,
            width: width,
            color: green2,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: height/4.8,),
                  Text('Failed!',style: TextStyle(
                      color: white,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'jml'),),
                  SizedBox(height: 20,),
                  CircleAvatar(backgroundColor: white,radius: 40,child: Icon(Icons.close,color: Colors.red,size: 50,),),
                  SizedBox(height: 25,),
                  Text('Your payment has been\n failed!!!',style: TextStyle(
                      color: white,fontSize: 26,fontWeight: FontWeight.w500,fontFamily: 'jml'),),
                  SizedBox(height: 50,),
                  SizedBox(height: 50,),
                  Container(height: 45,width: 250,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: white),
                    child: Center(child: Text('Try again',style: TextStyle(fontSize: 24,fontFamily:'jml',color: Colors.red),)
                    ),
                  ),

                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}
