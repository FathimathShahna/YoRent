import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/ADMIN/add_item.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';

import '../CONSTANT/callFunctions.dart';
import '../CONSTANT/mycolor.dart';
import '../USER/itemdetail.dart';

class items extends StatelessWidget {
  String catId,subCatId;
   items({super.key,required this.catId,required this.subCatId});
  // List <String> items=[
  //
  //
  // ];

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
          child: Text("Items",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
      body:SingleChildScrollView(
        child: SizedBox(
           // height: height/2,
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return value.loader?Center(child: CircularProgressIndicator()):
              GridView.builder(physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.Itemlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                     crossAxisSpacing: 1,
                     mainAxisSpacing: 1,
                    childAspectRatio: 0.75
                  ),
                  itemBuilder: (BuildContext context,int index){
                    var item=value.Itemlist[index];


                    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor: Color(0xffD9D9D9),
                                content: Text(
                                  "Are you sure want to edit or delete?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: green2,
                                      fontFamily: 'jml'),
                                ),
                                actions: [
                                  Row(
                                    children: [
                                      Consumer<MainProvider>(
                                          builder: (context, value, child) {
                                            return TextButton(
                                                onPressed: () {
                                                  finish(context);
                                                  value.fileItemImage =
                                                  null;
                                                  value.ItemImage = "";
                                                  value.EditItems(value.Itemlist[index].id);
                                                  callNext(context, add_item(
                                                    catId: catId, subCatId: subCatId, fromItem: "EDIT",iditem: value.Itemlist[index].id,
                                                  ));
                                                },
                                                child: Text("EDIT",
                                                  style: TextStyle(fontSize: 15, fontFamily: 'jml', color: green2),
                                                ));
                                          }),
                                      TextButton(
                                        onPressed: () {
                                          finish(context);
                                          value.deleteItem(value.Itemlist[index].id, context,catId,subCatId,);
                                        },
                                        child: Text(
                                          "DELETE", style: TextStyle(
                                            fontSize: 15, fontFamily: 'jml', color: Color(0xffFF0000)),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ));
                        },
                        onTap: (){

                        },
                        child: Container(width: 200,
                          height: height/3.5,
                          child: Card(
                            elevation: 20,
                            child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                child: Image.network(item.Image,fit: BoxFit.fill)),
                          ),
                        ),
                      ),

                      Center(child: Text(item.Name,style:
                      TextStyle(color: green2,fontSize: 22
                          ,fontFamily: 'jml',fontWeight: FontWeight.w400),))
                    ],
                  ),
                );

                  },
              );
            }
          ),
        ),
      ),
      floatingActionButton: Consumer<MainProvider>(
        builder: (context,value,child) {
          return FloatingActionButton(
              elevation: 2,
              backgroundColor: green2,child: Icon(Icons.add,color: white,size: 40,),
              shape:CircleBorder(eccentricity:1.0),onPressed: (){
                value.Itemclearfunction();
                 callNext(context, add_item(catId: catId,subCatId: subCatId,fromItem:"NEW",iditem: "",));

          });
        }
      ),
    );
  }
}
