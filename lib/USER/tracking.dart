import 'package:flutter/material.dart';
import 'package:yorent/CONSTANT/mywidget.dart';

import '../CONSTANT/mycolor.dart';

class tracking extends StatelessWidget {
  const tracking({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        iconTheme: IconThemeData(color: white),
        toolbarHeight: height/7.5,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("Track Order",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height:85,width: width,color: Colors.grey.withOpacity(0.5),
            child: ListTile(
              leading: Column(
                children: [
                  Text("Estimated Time",style: TextStyle(fontFamily: 'jml',fontSize: 20,color: green2),),
                  Text("1 Hour",style: TextStyle(fontFamily: 'jml',fontSize: 17,color: green2),),
                ],
              ),
            trailing: Column(
              children: [
                Text("Order Number",style: TextStyle(fontFamily: 'jml',fontSize: 20,color: green2),),
                Text("241523",style: TextStyle(fontFamily: 'jml',fontSize: 17,color: green2),),
              ],
            ),
            ),
            ),
            SizedBox(height: 10,),
           track(green2, Icons.shopping_cart, 'Order Placed', 'June 10,2018,03:45pm'),
           track(green2, Icons.home_work_outlined, 'Order Dispatched', 'June 10,2018,03:45pm'),
        Row(
          children: [
            Column(
              children: [
                CircleAvatar(radius:30,
                  backgroundColor: green2,
                  child: Icon(Icons.fire_truck,color: white,size: 40,),),
               Text("|\n|",style: TextStyle(fontSize: 40,color: Colors.grey),),
              ]
            ),
            SizedBox(width:30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Order In Transit',style: TextStyle(fontFamily: 'jml',fontSize: 20,color: green2),),
                Text('Reached at thirur,malappuram',style: TextStyle(fontFamily: 'jml',fontSize: 15,
                    color: Colors.orange[400]),),
              ],
            )
          ],
        ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                    children: [
                      CircleAvatar(radius:30,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.thumb_up_alt_rounded,color: white,size: 40,),),
                      // Text("|\n|\n|\n",style: TextStyle(fontSize: 40),),
                    ],
                ),
                SizedBox(width:30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Order In Transit',style: TextStyle(fontFamily: 'jml',fontSize: 20,color: Colors.grey),),
                    Text('Reached at thirur,malappuram',style: TextStyle(fontFamily: 'jml',fontSize: 15,
                        color: Colors.orange[400]),),
                  ],
                )
              ],
            ),
           SizedBox(height: 20,),
           Container(height: 50,width: 250,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
             child: Center(
               child: Text("Cancel Your Order",style:TextStyle(fontFamily: 'jml',fontSize: 20,
                   color: white),),
             ),
           ),
            SizedBox(height: 30,),
           // track(green2, Icons.fire_truck, 'Order In Transit', 'Reached at perinthalmanna,malappuram'),
          ],
        ),
      ),

    );
  }
}
