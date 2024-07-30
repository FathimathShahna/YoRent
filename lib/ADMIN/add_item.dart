import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';


import '../CONSTANT/callFunctions.dart';
import '../CONSTANT/mycolor.dart';
import 'items.dart';

class add_item extends StatelessWidget {
  String catId;
  String subCatId;
  String fromItem;
  String iditem;
   add_item({super.key,required this.catId,required this.subCatId,required this.fromItem,required this.iditem});

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
          child: Text("Add Item",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Text('Item Name',style: TextStyle(fontFamily: 'jml',fontSize: 22,fontWeight: FontWeight.w500,color: green2),),
              SizedBox(height: 20,),
              Container(
                height: 60,width: width/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),color: Colors.grey[400],border: Border.all(color: Colors.grey)),
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return TextField(
                      style: TextStyle(fontFamily: "jml",fontSize: 18,color: green2),
                      keyboardType: TextInputType.text,
                      controller: value.ItemNameController,
                      decoration: InputDecoration(border: InputBorder.none,
                        hintText: "Item Name",
                        hintStyle: TextStyle(color: Colors.grey,fontFamily: 'jml'),
                      ));
                }
              ),),
              SizedBox(height: 15,),
              Text('Description',style: TextStyle(fontFamily: 'jml',fontSize: 22,fontWeight: FontWeight.w500,color: green2),),
              SizedBox(height: 20,),
              Container(
                height: 120,width: width/2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color: Colors.grey[400],border: Border.all(color: Colors.grey)),
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return TextField(
                      maxLines: 6,
                        style: TextStyle(fontFamily: "jml",fontSize: 18,color: green2),
                        keyboardType: TextInputType.text,
                        controller: value.DescriptionController,
                        decoration: InputDecoration(border: InputBorder.none,
                            hintText: "Description",
                            hintStyle: TextStyle(color: Colors.grey,fontFamily: 'jml')
                        ));
                  }
                ),),
              SizedBox(height: 15,),
              Text('Price',style: TextStyle(fontFamily: 'jml',fontSize: 22,fontWeight: FontWeight.w500,color: green2),),
              SizedBox(height: 20,),
              Container(
                height: 60,width: width/2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color: Colors.grey[400],border: Border.all(color: Colors.grey)),
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return TextField(
                        style: TextStyle(fontFamily: "jml",fontSize: 18,color: green2),
                        keyboardType: TextInputType.number,
                        controller: value.PriceController,
                        decoration: InputDecoration(border: InputBorder.none,
                            hintText: "Price",
                            hintStyle: TextStyle(color: Colors.grey,fontFamily: 'jml')
                        ));
                  }
                ),),
              SizedBox(height: 15,),
              Text('Image',style: TextStyle(fontFamily: 'jml',fontSize: 22,fontWeight: FontWeight.w500,color: green2),),
              SizedBox(height: 20,),
              Center(
                 child: Consumer<MainProvider>(
                  builder: (context,value,child) {
               return InkWell(
                   onTap: (){
                  showBottomSheet(context);   },
                child:
                value.fileItemImage!=null?
                Container(height: 140,
                       width: width/2,
                    decoration: BoxDecoration(borderRadius:
                    BorderRadius.circular(20),color: Colors.grey[400],border: Border.all(color: Colors.grey) ),
                    child: Image.file(value.fileItemImage!,fit: BoxFit.fill,)):value.ItemImage!=""?Container(height: 140,
                    width: width/2,
                    decoration: BoxDecoration(borderRadius:
                    BorderRadius.circular(20),color: Colors.grey[400],border: Border.all(color: Colors.grey) ),
                    child: Image.network(value.ItemImage,fit: BoxFit.fill,)):
                 Container(
                         height: 140,
                        width: width/2,
                   decoration: BoxDecoration(borderRadius:
                   BorderRadius.circular(20),color: Colors.grey[400],border: Border.all(color: Colors.grey) ),
                    child: Column(
                       children: [
                         SizedBox(height: 20,),
                          Icon(Icons.image_search_sharp,color: Colors.grey,size: 90,),
                         Text('Add image',style: TextStyle(color: Colors.grey,fontFamily: 'jml'),)
                       ],
                    ),)

                   );

                  }
                  ),
              ),
              SizedBox(height: 30,),
              Center(child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: (){
                      if(fromItem=="NEW"){
                        value.addItem(catId,subCatId,context,"NEW","");
                      }else
                        {
                          value.addItem(catId, subCatId, context, "EDIT", iditem);
                          //callNext(context, items(catId: catId, subCatId: subCatId));
                        }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        content: Center(child: Text('Added',style: TextStyle(color: white,fontFamily: 'jml',fontSize: 20
                        ),)),
                        backgroundColor: green2,));
                      finish(context);


                    },
                    child: Container(height: 50,width: 140,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
                    child: Center(child: Text('Save',style: TextStyle(fontSize: 28,fontFamily: 'jml',color: white),)),
                    ),
                  );
                }
              )),
              SizedBox(height: 30,),

            ],
          ),
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
             onTap: () => {donationProvider.getItemImagecamera(), Navigator.pop(context)}),
       ListTile(
               leading:  Icon(Icons.photo, color: green2),
               title: const Text('Gallery',),
             onTap: () => {donationProvider.getItemImagegallery(),Navigator.pop(context)}),
              ],
             );
             });

    }
}
