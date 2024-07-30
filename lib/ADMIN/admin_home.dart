import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/ADMIN/Orders.dart';
import 'package:yorent/ADMIN/category.dart';
import 'package:yorent/ADMIN/users.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mycolor.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';

import '../USER/login.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height/7,
        backgroundColor: green2,
        automaticallyImplyLeading: false,
        title: Center(
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(height: 30,),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return InkWell(
                onTap: (){

                  value.getCategoryList();
                  callNext(context, category());



              },
                child: Container(height: 90,
                width: width/2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2,),
                  child: Center(child: Text('Category',style: TextStyle(color: white,fontSize: 28,fontFamily: 'jml',fontWeight: FontWeight.bold),)),
                ),
              );
            }
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: (){callNext(context, users());},
            child: Container(height: 90,
              width: width/2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2,),
              child: Center(child: Text('Users List',style: TextStyle(color: white,fontSize: 28,fontFamily: 'jml',fontWeight: FontWeight.bold),)),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){callNext(context, orders());},
            child: Container(height: 90,
              width: width/2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2,),
              child: Center(child: Text('Orders',style: TextStyle(color: white,fontSize: 28,fontFamily: 'jml',fontWeight: FontWeight.bold),)),
            ),
          ),
        ],),
      ),
        floatingActionButton: Consumer<MainProvider>(
        builder: (context,value,child) {
          return InkWell(
            child: FloatingActionButton(
                elevation: 3,
                backgroundColor: green2,
                child: Icon(Icons.logout, color: white, size: 30,),
                shape: CircleBorder(eccentricity: 1.0),
                onPressed: () {
                  alert(context);



                }),
          );
        })
    );
  }
}
 alert(BuildContext context){
  showDialog(context: context, builder: (ctx)=>
      AlertDialog(
        backgroundColor: green2,
        title: Center(child: Text("Are you sure?",style: TextStyle(color: white,fontSize: 20,fontFamily: 'jml'),)),
        actions: [
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(color: white,
                    borderRadius: BorderRadius.circular(23)),
                child: TextButton(onPressed: (){

                }, child: Text("Cancel",style: TextStyle(color: green2,fontFamily: 'jml',fontSize: 18),)),
              ),
              Container(
                width: 90,
                decoration: BoxDecoration(color: white,
                    borderRadius: BorderRadius.circular(23)),
                child: TextButton(onPressed: (){
                  FirebaseAuth auth=FirebaseAuth.instance;
                  auth.signOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context)=>login()),
                          (Route<dynamic>route) => false);
                }, child: Text("Yes",style: TextStyle(color: green2,fontFamily: 'jml',fontSize: 18),)),
              )
            ],
          )
        ],
      ));
 }