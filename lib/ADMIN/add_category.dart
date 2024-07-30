import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/ADMIN/category.dart';
import 'package:yorent'
    '/CONSTANT/callFunctions.dart';

import '../CONSTANT/mycolor.dart';
import '../MODELCLASS/modelclass.dart';
import '../PROVIDER/mainProvider.dart';

class add_category extends StatelessWidget {
  String from;
  String categoryid;
   add_category({super.key,required this.from,required this.categoryid});

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider=Provider.of<MainProvider>(context,listen: false);
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        iconTheme: IconThemeData(color: white),
        toolbarHeight: height/7.5,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("Add Category",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(height: 67,
              width: width/2.3,
              decoration: BoxDecoration(color: green2,
                  border: Border.all(color: green2),),
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return TextFormField(
                    controller: value.categoryNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width: 6)),
                        hintText: "Category Name",
                        hintStyle: TextStyle(color: Colors.white,fontFamily: 'jml')

                    ),
                    style: TextStyle(color: Colors.white),

                  );
                }
              ),
              ),
            ),
            SizedBox(height: 25,),
            Center(
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: (){
                      showBottomSheet(context);
                      },
                    child:
                    value.fileCategoryImage!=null?
                    Container(
                        height: 170,
                    width: width/2.3,
                    child: Image.file(value.fileCategoryImage!)):value.image!=""?
                    Container(
                        height: 170,
                        width: width/2.3,
                        // color: green2,
                        child: Image.network(value.image!,fit: BoxFit.fill,)):
                        Container(
                          height: 170,
                          width: width/2.3,
                          color: green2,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Icon(Icons.image_search_sharp,color: white,size: 90,),
                              Text('Add image',style: TextStyle(color: white,fontFamily: 'jml'),)
                            ],

                          ),),

                  );
                }
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: (){
                // mainProvider.addCategory();
               // callNext(context, categoryModel());
              },
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: (){
                      if(from=="NEW"){
                        value.addCategory("NEW","");
                      }else{
                        value.addCategory("EDIT", categoryid);
                      }


                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        content: Center(child: Text('Added',style: TextStyle(color: white,fontFamily: 'jml',fontSize: 20
                        ),)),
                        backgroundColor: green2,));
                      finish(context);
                    },
                    child: Container(height: 60,
                    width: 130,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
                    child: Center(child: Text('Add',style: TextStyle(fontSize: 28,fontFamily: 'jml',color: white),)),),
                  );
                }
              ),
            )
          ],
        ),
      ),

    );
  }
  void showBottomSheet(BuildContext context) {
    MainProvider donationProvider =Provider.of<MainProvider>(context,listen: false);

    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
    topRight: Radius.circular(10.0),
    )),
    context: context,
    builder: (BuildContext bc) {
      return Wrap(
        children: <Widget>[
          ListTile(
              leading:  Icon(
                Icons.camera_enhance_sharp,
                color: green2,
              ),
              title: const Text('Camera',),
              onTap: () => {donationProvider.getImagecamera(), Navigator.pop(context)}),
          ListTile(
              leading:  Icon(Icons.photo, color: green2),
              title: const Text('Gallery',),
              onTap: () => {donationProvider.getImagegallery(),Navigator.pop(context)}),
        ],
      );
    });

    }

    }
