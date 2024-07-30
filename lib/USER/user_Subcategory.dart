import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mycolor.dart';
import 'package:yorent/CONSTANT/mywidget.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/dresslist.dart';


class User_subctgry extends StatelessWidget {
  String catid,userId,Name;
  User_subctgry({super.key,required this.catid,required this.userId,required this.Name});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        iconTheme: IconThemeData(color: white),
        toolbarHeight: height/7.5,
        title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Column(
                    children: [
                      Text(Name,style: TextStyle(
                          fontFamily: 'sarina',fontSize: 30,color: Colors.white),),
                      Text("___find your dream dress___",style: TextStyle(
                        fontSize: 18,color: white,fontFamily: 'n1'),)
                    ],
                  );
                }
              ),
            )),


      ),
      body: Consumer<MainProvider>(
        builder: (context,value,child) {
          return value.categorylist.isNotEmpty?Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: value.Subcategorylist.length,
                itemBuilder: (context,index){
                  var item= value.Subcategorylist[index];

                  return Row(
                  children: [
                    SizedBox(
                      height: 250,
                      child: Stack(
                        children: [
                          Container(
                          height: 200,
                          width: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(item.Image,),fit: BoxFit.fill ),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(80),topRight: Radius.circular(80)),
                          boxShadow: [BoxShadow(blurRadius: 3),]
                          ),
                        ),
                          Positioned(
                            top: 180,
                            left: 5,
                            child: Container(height: 44,
                            width: 147,
                            color: green2,
                            child: Center(
                                child: Text(item.Name,style: TextStyle(
                                    fontSize: 28,fontWeight: FontWeight.w600,color: white,fontFamily: 'Sacramento'),)),),
                          )
                        ]
                      ),
                    ),
                    Column(
                      children: [
                    SizedBox(
                                width: 180,
                                child: Text("  “..this is more than just a "
                                    "wedding \n    dress. It is embodiment "
                                    "of a\n        dream come true.”    \n"
                                    "            -Keoula Wheeler",
                                style: TextStyle(fontSize: 15,fontFamily: 'n1',color: green2),
                                ),
                              ),
                              SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  value.getItems(catid,value.Subcategorylist[index].id);
                                  callNext(context, dresslist(catId: catid,subCatId: item.id,userId: userId,Name: item.Name
                                    ,))
                                  ;
                                },
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  color: green2,
                                  child: Center(child: Text("more",style: TextStyle(color: white,fontSize: 28,fontFamily: 'n1'),)),

                                ),
                              ),

                      ],
                    )
                  ],
                );


                }),
          ):Center(child: Text("Empty...",style: TextStyle(color: Colors.black),));
        }
      ),


    );
  }
}
