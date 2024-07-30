import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/ADMIN/add_subCategory.dart';
import 'package:yorent/ADMIN/items.dart';

import '../CONSTANT/callFunctions.dart';
import '../CONSTANT/mycolor.dart';
import '../PROVIDER/mainProvider.dart';
import 'add_category.dart';

class sub_category extends StatelessWidget {
  String catid;
  sub_category({super.key, required this.catid});

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
          child: Text("Sub Category", style: TextStyle(fontSize: 32, color: white, fontFamily: 'jml'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // height: height/2,
          child: Consumer<MainProvider>(builder: (context, value, child) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.Subcategorylist.length,
              padding: EdgeInsets.symmetric(horizontal: 2),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 0.75),
              itemBuilder: (BuildContext context, int index) {
                var item = value.Subcategorylist[index];

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
                                                  value.fileSubCategoryImage =
                                                      null;
                                                  value.Imageurl = "";
                                                  value.EditSubGetData(value.Subcategorylist[index].id);
                                                  callNext(context, add_subcategory(
                                                    catId: catid, from2: "EDIT",
                                                    editId: value.Subcategorylist[index].id,));
                                                },
                                                child: Text("EDIT",
                                                  style: TextStyle(fontSize: 15, fontFamily: 'jml', color: green2),
                                                ));
                                          }),
                                          TextButton(
                                            onPressed: () {
                                              finish(context);
                                              value.deleteSubcat(value.Subcategorylist[index].id, context, catid);
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
                          value.getItems(catid,value.Subcategorylist[index].id);
                          callNext(context, items(catId: catid,subCatId: item.id,));
                          },
                        child: Container(
                          width: 200,
                          height: height / 3.5,
                          decoration: BoxDecoration(boxShadow:  [BoxShadow(color:Colors.grey,offset: Offset(0, 10),blurRadius: 10)],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(item.Image,),fit: BoxFit.fill)),
                        ),
                      ),
                      Center(
                          child: Text(item.Name,
                        style: TextStyle(color: green2, fontSize: 24, fontFamily: 'jml',
                            fontWeight: FontWeight.w400),
                      ))
                    ],
                  ),
                );
                //
              },
            );
          }),
        ),
      ),
      floatingActionButton:
          Consumer<MainProvider>(builder: (context, value, child) {
        return FloatingActionButton(
            elevation: 2,
            backgroundColor: green2,
            child: Icon(Icons.add, color: white, size: 40,
            ),
            shape: CircleBorder(eccentricity: 1.0),
            onPressed: () {
              value.subctgryclearfunction();

              callNext(
                  context,
                  add_subcategory( catId: catid,from2: "NEW", editId: '',));
            });
      }),
    );
  }
}
