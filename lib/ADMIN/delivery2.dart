import 'package:flutter/material.dart';
import 'package:yorent/ADMIN/order%20status.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';

import '../CONSTANT/mycolor.dart';

class order_deails extends StatelessWidget {
  const order_deails({super.key});

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
            "Order Details",
            style: TextStyle(fontSize: 32, color: white, fontFamily: 'jml'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Delivery Address',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'jml', color: green2),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                width: width / 2.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[400],
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fathima Shahanas',
                        style: TextStyle(
                            fontFamily: 'jml', color: green2, fontSize: 20),
                      ),
                      Text(
                        'Peerali House,Korangode',
                        style: TextStyle(
                            fontFamily: 'jml', color: green2, fontSize: 17),
                      ),
                      Text(
                        'Malappuram',
                        style: TextStyle(
                            fontFamily: 'jml', color: green2, fontSize: 17),
                      ),
                      Text(
                        '678341',
                        style: TextStyle(
                            fontFamily: 'jml', color: green2, fontSize: 17),
                      ),
                      Text(
                        '8943516051',
                        style: TextStyle(
                            fontFamily: 'jml', color: green2, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Orders',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'jml', color: green2),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black12,
                            image: DecorationImage(
                                image: AssetImage('assets/saree.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      title: Text(
                        "Designer Saree",
                        style: TextStyle(
                            color: green2, fontFamily: 'jml', fontSize: 20),
                      ),
                      subtitle: Text(
                        "price: 190",
                        style: TextStyle(
                            color: Colors.red[300],
                            fontSize: 19,
                            fontFamily: 'jml'),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          elevation: 2,backgroundColor: green2,label: Text('Proceed',
        style: TextStyle(color: white,fontFamily: 'jml',fontSize: 20),),

          shape: OutlineInputBorder(borderSide: BorderSide(color: green2),borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            callNext(context, order_status());
          }),
    );
  }
}
