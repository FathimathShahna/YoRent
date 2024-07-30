import 'package:flutter/material.dart';
import 'package:yorent/ADMIN/delivery2.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';

import '../CONSTANT/mycolor.dart';

class delivery extends StatelessWidget {
  const delivery({super.key});

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
          child: Text("Delivery Orders",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: height,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        margin: EdgeInsets.all(8),


                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: ListTile(
                          title: Text('Shivani Fernandes',style: TextStyle(
                              color: Colors.grey[800],fontFamily: 'jml',fontSize: 20,fontWeight: FontWeight.w500),),
                          subtitle: Text('Srinilayam,palakkad,203....',style: TextStyle(
                              color: Colors.grey[700],fontFamily: 'jml',fontSize: 16,),),
                          trailing: InkWell(
                            onTap: (){
                              callNext(context, order_deails());
                            },
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
                              child: Center(child: Text('Take',style: TextStyle(fontFamily: 'jml',fontSize: 15,color: white),)),
                            ),
                          ),


                        ),

                         );
                    }
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
