import 'package:flutter/material.dart';

import '../CONSTANT/mycolor.dart';

class order_status extends StatefulWidget {
  const order_status({super.key});

  @override
  State<order_status> createState() => _order_statusState();
}

class _order_statusState extends State<order_status> {
  bool _myBoolean = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        iconTheme: IconThemeData(color: white),
        toolbarHeight: height / 7.5,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "Order Status",
            style: TextStyle(fontSize: 32, color: white, fontFamily: 'jml'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Fathima Shahnas",style: TextStyle(fontSize: 22,fontFamily: 'jml',color: green2),),
            SizedBox(height: 20,),
            Container(height: 300,
            width: width/2.2,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[300]),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Placed',style: TextStyle(fontFamily: 'jml',fontSize: 20,color: green2),),
                      Checkbox(
                        value: _myBoolean,
                        onChanged: ( value) {
                          setState(() {
                            _myBoolean =value!; // rebuilds with new value
                          });
                        },
                      ),

                  ]),
                  SizedBox(height: 20,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Dispatched',style: TextStyle(fontFamily: 'jml',fontSize: 20,color: green2),),
                        Checkbox(
                          value: _myBoolean,
                          onChanged: ( value) {
                            setState(() {
                              _myBoolean =value!; // rebuilds with new value
                            });
                          },
                        ),

                      ]),
                  SizedBox(height: 20,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order In Transit',style: TextStyle(fontFamily: 'jml',fontSize: 20,color: green2),),
                        Checkbox(
                          value: _myBoolean,
                          onChanged: ( value) {
                            setState(() {
                              _myBoolean =value!; // rebuilds with new value
                            });
                          },
                        ),

                      ]),
                  SizedBox(height: 20,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivered Succesfully',style: TextStyle(fontFamily: 'jml',fontSize: 20,color: green2),),
                        Checkbox(
                          value: _myBoolean,
                          onChanged: ( value) {
                            setState(() {
                              _myBoolean =value!; // rebuilds with new value
                            });
                          },
                        ),

                      ]),
                ],
              ),
            ),
            )
          ],
        ),
      ),

    );
  }
}
