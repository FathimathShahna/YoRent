import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';

import '../CONSTANT/callFunctions.dart';
import '../CONSTANT/mycolor.dart';
import '../MODELCLASS/modelclass.dart';
import 'category.dart';

class add_subcategory extends StatelessWidget {
  String catId;
  String from2;
  String editId;
   add_subcategory({super.key,required this.catId,required this.from2,required this.editId});

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
          child: Text("Add Sub Category",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
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
                    return TextField(
                      keyboardType: TextInputType.text,
                      controller: value.SubCategoryNameController,
                      decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 6),),
                        hintText: "Sub Category Name",
                        hintStyle: TextStyle(color: white,fontFamily: 'jml'),

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
                      showBottomSheet(context);                   },
                    child:
                    value.fileSubCategoryImage!=null?
                     Container(height: 170,
                      width: width/2.3,
                      child: Image.file(value.fileSubCategoryImage!,fit: BoxFit.fill,)):value.Imageurl!=""?
                  Container(height: 170,
                        width: width/2.3,
                       color: green2,
                         child: Image.network(value.Imageurl!,fit: BoxFit.fill,)):
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
                          ),)

                  );

                }
              ),
            ),
            SizedBox(height: 40,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                onTap: (){

                  if(from2=="NEW"){
                    value.addSubCategory('',catId,context,"NEW");
                  }else{
                    value.addSubCategory(editId,catId, context,"EDIT" );
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
                  onTap: () => {donationProvider.getSubImagecamera(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: green2),
                  title: const Text('Gallery',),
                  onTap: () => {donationProvider.getSubImagegallery(),Navigator.pop(context)}),
            ],
          );
        });

  }
}
