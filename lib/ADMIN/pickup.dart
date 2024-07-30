import 'package:flutter/material.dart';

import '../CONSTANT/mycolor.dart';

class pickup extends StatelessWidget {
  const pickup({super.key});

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
          child: Text("Pick Up Orders",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
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
                        child: ListTile(title: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shivani Fernandes',style: TextStyle(color: Colors.grey[800],fontFamily: 'jml',fontSize: 20,fontWeight: FontWeight.bold),),
                              Text("8943516052",style: TextStyle(color: Colors.grey[800],fontFamily: 'jml',fontSize: 18),),
                              Text("Pakistani red and white lahanka",style: TextStyle(color: Colors.grey[800],fontFamily: 'jml',fontSize: 15),),
                              Text("will pick on 27th march",style: TextStyle(color: Colors.grey[600],fontFamily: 'jml',fontSize: 15),)
                            ],
                          ),
                        ),

                        ), );
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
