import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/ADMIN/add_category.dart';
import 'package:yorent/ADMIN/sub_category.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';

import '../CONSTANT/mycolor.dart';

class category extends StatelessWidget {
  const category( {super.key});

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
          child: Text("Category",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
       body: SizedBox(height: height,
         child: Consumer<MainProvider>(
           builder: (context,value,child) {
             return GridView.builder(
               itemCount: value.categorylist.length,
                 padding: EdgeInsets.symmetric(horizontal: 2),
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   mainAxisSpacing: 10,
                     mainAxisExtent: 180,
                     crossAxisSpacing: 5,
                     crossAxisCount: 2,
                 childAspectRatio: 0.8,),
                 itemBuilder: (BuildContext context,int index){
                 var item= value.categorylist[index];
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       InkWell(
                         onLongPress: (){
                         showDialog(
                             context: context,
                             builder: (ctx) => AlertDialog(
                               backgroundColor: Color(0xffD9D9D9),

                               content:Text("Are you sure want to edit or delete?",
                                 style: TextStyle(
                                   fontSize: 15,
                                   // fontFamily: 'Futura',
                                   color:  green2,
                                 ),),
                               actions: [
                                 Row(
                                   children: [
                                     Consumer<MainProvider>(
                                         builder: (context,value,child) {
                                           return TextButton(
                                               onPressed: () {
                                                 finish(context);
                                                 value.fileCategoryImage=null;
                                                 value.image="";
                                                 value.EditGetData(value.categorylist[index].id);
                                                 callNext(context, add_category(
                                                   from: "EDIT",categoryid:value.categorylist[index].id,));

                                               },
                                               child: Text("EDIT",
                                                 style: TextStyle(fontSize: 15,  fontFamily: 'jml',color:green2
                                                 ),));
                                         }
                                     ),
                                     TextButton(
                                       onPressed: () {
                                         finish(context);
                                         value.delete(value.categorylist[index].id,context);

                                       },

                                       child: Text("DELETE",
                                         style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xffFF0000)
                                         ),),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                             );
                       },
                         onTap: (){
                           value.getSubCategory(value.categorylist[index].id);

                           callNext(context, sub_category(catid: value.categorylist[index].id,));
                           // value.getCategoryList();
                         },
                         child: Container(height: 130,
                             width: 130,
                      child: Image.network(item.Image,fit: BoxFit.fill,)
                         ),
                       ),

                       Text(item.Name,style: TextStyle(color: green2,fontSize: 24,fontFamily: 'jml',fontWeight: FontWeight.w400),)

                     ],
                   ),
                 );}
             );
           }
         ),
       ) ,

      floatingActionButton: Consumer<MainProvider>(
        builder: (context,value,child) {

          return FloatingActionButton(
              elevation: 2,
              backgroundColor: green2,child: Icon(Icons.add,color: white,size: 40,),
              shape:CircleBorder(eccentricity:1.0),onPressed: (){
                value.clearfunction();
                callNext(context, add_category(from: "NEW",categoryid: "",));

          });
        }
      ),
    );
  }
}
