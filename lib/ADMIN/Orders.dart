import 'package:flutter/material.dart';
import 'package:yorent/ADMIN/Delivery.dart';
import 'package:yorent/ADMIN/pickup.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';

import '../CONSTANT/mycolor.dart';

class orders extends StatelessWidget {
  const orders({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        iconTheme: IconThemeData(color: white),
        toolbarHeight: height/7.5,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("Orders",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height/7,),
            Column(
              children: [
                InkWell(
                  onTap: (){
                    callNext(context, pickup());
                  },
                  child: Container(
                    height: 180,
                    width: width/3.8,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
                    child: Icon(Icons.directions_walk,color: white,size: 70,),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Pick Up Orders',style: TextStyle(fontSize: 20,fontFamily: 'jml',color: green2),)
              ],
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                InkWell(
                  onTap: (){
                    callNext(context, delivery());
                  },
                  child: Container(
                    height: 180,
                    width: width/3.8,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
                    child: Icon(Icons.delivery_dining,color: white,size: 70,),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Delivery Orders',style: TextStyle(fontSize: 20,fontFamily: 'jml',color: green2),)
              ],
            ),

          ],
        )



        ),


    );
  }
}
