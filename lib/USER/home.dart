import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mycolor.dart';
import 'package:yorent/CONSTANT/mywidget.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/user_Subcategory.dart';

class home extends StatelessWidget {
String userId;
   home({super.key,required this.userId});
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor:green2,toolbarHeight: height/7,
        iconTheme: IconThemeData(color: white),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: RichText(text:   TextSpan(
            text: 'YO!',style: TextStyle(
            fontSize: 30,fontWeight: FontWeight.w900,color:white,
            fontFamily:'f1'
          ),
              children:
              <TextSpan>[
                TextSpan(text: ' Rent',style: TextStyle(
                    fontWeight: FontWeight.w900,
                  color: white,fontFamily:'f2'
                ))
              ]
          )),
        ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 45,
                  width: width/2.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),color: Colors.grey[200]
                      ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    prefixIcon: Icon(Icons.search),
                      prefixIconColor: f1,
                      hintText: 'search',
                      hintStyle: TextStyle(color: f1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Categories',style: TextStyle(
                    color: green1,fontWeight: FontWeight.w500,fontSize: 30,fontFamily: 'n1'),),
              ),
              // InkWell(
              //   onTap: (){
              //     callNext(context, dresses());
              //   },
            Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Expanded(
                    child:  value.categorylist.isNotEmpty?ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.categorylist.length,
                        itemBuilder: (context, index){
                          var item= value.categorylist[index];
                          return Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        value.getSubCategory(value.categorylist[index].id);
                                        callNext(context, User_subctgry(catid: value.categorylist[index].id,userId: userId,Name: item.Name));
                                        },
                                      child: Container(
                                        height: 190,
                                        width: 290,
                                        decoration: BoxDecoration(
                                        image: DecorationImage(
                                                 image: NetworkImage(item.Image,),fit: BoxFit.fill),
                                        //  image: DecorationImage(image: Image.network(item.Image,fit: BoxFit.fill,),
                                          borderRadius: BorderRadius.circular(25
                                          ),
                                           boxShadow: [BoxShadow(
                                              blurRadius: 2
                                          )],
                                        ),
                                        //child: Image.network(item.Image,fit: BoxFit.fill,),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(top: 160,
                                  left: 90,
                                  child: Container(
                                    // padding: EdgeInsets.only(left: lft,top: top,right: rgt),
                                    height: 48,
                                    width: 230,
                                    color: green2,
                                    child: Center(
                                      child: Text(item.Name,style: TextStyle(
                                          fontSize: 35,fontWeight: FontWeight.w600,color: white,fontFamily: 'Sacramento'),),
                                    ),
                                  ),
                                ),
                              ]
                          );
                        }):Center(child: Text("Empty...",style: TextStyle(color: Colors.black),)),
                  );
                }
            ),
          ],
             ),
      ),
    );
  }
}
