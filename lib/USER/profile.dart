import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mywidget.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/address.dart';
import 'package:yorent/USER/editprfile.dart';
import 'package:yorent/USER/login.dart';
import 'package:yorent/USER/myorders.dart';

import '../CONSTANT/mycolor.dart';

class profile extends StatelessWidget {
  String userId,Name,Phone;
   profile({super.key,required this.userId,required this.Name,required this.Phone});

  @override

  Widget build(BuildContext context) {
    print("jhbcjdscnkdsj"+Name);
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(toolbarHeight: height/2.5,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: green2,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(29),bottomRight: Radius.circular(20))),
        title: Center(
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Profile",style: TextStyle(color: white,fontSize: 30,fontFamily: 'jml'),),
                  SizedBox(height: 20,),
                  value.fileprofileImage!=null?
                  CircleAvatar(radius: 50,backgroundColor: Colors.white,backgroundImage: FileImage(value.fileprofileImage!),):
                      value.profileImage!=""?
                  CircleAvatar(radius: 50,backgroundColor: Colors.white,backgroundImage: NetworkImage(value.profileImage!),):
                  CircleAvatar(radius: 50,backgroundColor: Colors.white,child: Icon(Icons.person_add,color: Colors.grey,),),
               SizedBox(height: 20,),
               Text(value.UserNameController.text.toString(),style: TextStyle(
                   color: white,fontSize: 25,fontWeight: FontWeight.w500,
                    fontFamily: 'jml'
                     ),),
                  Text(Phone,style: TextStyle(
                      color: white,fontSize: 23,
                     fontFamily: 'jml',fontWeight: FontWeight.w300
                     ),)


                ],
              );
            }
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              height: height/2.1,
              width: width/1.3,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15)),
              child:Column(
                children: [
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                        onTap: (){
                          callNext(context, editprofile(userId: userId,));
                          value.GetCustomerfn(userId);
                        },
                          child: profiledit('Edit Profile', Icons.account_box_rounded,));
                    }
                  ),
                  InkWell(
                      onTap: (){
                        //callNext(context, address(userId: userId,));
                      },
                      child: profiledit('Address', Icons.location_history)),
                  InkWell(
                      onTap: (){
                        callNext(context, myorder());
                      },
                      child: profiledit('My Orders', Icons.library_books,)),
                  InkWell(
                      onTap: (){
                         showGeneralDialog(context: context,
                           transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
                             filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                             child: FadeTransition(
                               child: child,
                               opacity: anim1,
                             ),
                           ),
                             pageBuilder: (ctx,anim1,anim2)=>AlertDialog(
                               actions: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                     Container(
                                       width: 110,
                                       decoration: BoxDecoration(
                                           color: green2,
                                           borderRadius: BorderRadius.circular(23)),
                                       child: TextButton(onPressed: (){},
                                           child: Text('Cancel',style: TextStyle(
                                             color: white,fontSize:18,fontFamily: 'jml'
                                           ),)),
                                     ),
                                     Container(
                                       width: 80,
                                       decoration: BoxDecoration(
                                           color: green2,
                                           borderRadius: BorderRadius.circular(23)),
                                       child: InkWell(
                                         onTap: (){
                                           callNext(context, login());
                                         },
                                         child: InkWell(
                                           onTap: (){
                                             back(context, );
                                           },
                                           child: TextButton(
                                               onPressed: (){
                                                 FirebaseAuth auth=FirebaseAuth.instance;
                                                 auth.signOut();
                                                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                                     builder: (context)=>login()),
                                                         (Route<dynamic>route) => false);
                                                // callNext(context, login());
                                               },
                                               child: Text('Yes',style: TextStyle(
                                                   color: white,fontSize:18,fontFamily: 'jml'
                                               ),)),
                                         ),
                                       ),
                                     ),
                                   ],
                                 )
                               ],
                               title: Center(child: Text('Are you sure?',style: TextStyle(
                                   fontSize: 25,fontFamily: 'jml',color: green2),)),
                             ),

                         );

                      },
                    child: profiledit('Log Out', Icons.logout
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
