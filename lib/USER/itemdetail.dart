import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/mywidget.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';

import '../CONSTANT/mycolor.dart';

class details extends StatelessWidget {
  String catId, subCatId;
  String Name;
  String Description;
  String Price;
  String Image;
  String ItemId;
  String userId;

   details({super.key,required this.catId,
     required this.subCatId,
     required this.Name,
     required this.Description,
     required this.Price,
     required this.Image,
     required this.ItemId,
     required this.userId
   });

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


    return Container(
    height: height,
      width: width,
      decoration:BoxDecoration(image: DecorationImage(image: NetworkImage(Image),fit: BoxFit.cover
      )),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: green2,
          iconTheme: IconThemeData(color: white),
          toolbarHeight: height/8.5,
          title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Column(
                  children: [
                    Text("Deatils",style: TextStyle(
                        fontFamily: 'sarina',fontSize: 30,color: Colors.white),),
                    Text("___find your dream dress___",style: TextStyle(
                        fontSize: 18,color: white,fontFamily: 'n1'),)
                  ],
                ),
              )),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              SizedBox(height: height/5.7,),
    InkWell(
      onTap: (){
        showBottomSheet(context);

      },
      child: Container(height: 50,
      width: width,
      decoration: BoxDecoration(
        color: green2,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),

      child: Center(child: Text("View Details",style: TextStyle(color: white,fontFamily: 'jml',fontWeight: FontWeight.w500,fontSize: 20),)),),
    )


       ]),
      )
     );
  }
   void showBottomSheet(BuildContext context) {
     MainProvider donationProvider =Provider.of<MainProvider>(context,listen: false);


    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white60,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: <Widget>[
                SizedBox(height: 15,),
                Center(
                  child: Text(Name,style: TextStyle(color: green2,fontSize: 30,
                      fontWeight: FontWeight.w600,fontFamily: 'jml'),),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text("Description",style: TextStyle(color: green2,fontSize: 27,fontFamily: 'jml',
                      fontWeight: FontWeight.w400

                  ),),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(Description,style: TextStyle(
                      color: white,fontSize: 20,fontWeight: FontWeight.w300,fontFamily: 'jml'
                  ),),
                ),
                // SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("$Price/-",style: TextStyle(fontSize: 25,color: Colors.yellow[800],fontFamily: 'jml'),),
                    Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return InkWell(
                          onTap: (){
                            value.addToCart( catId, subCatId, context,ItemId,userId,Name,Price,Image);
                          },
                          child: Container(
                            height: 50,
                            width: 160,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: green2,),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_cart_outlined,color: white,size: 28,),
                                  Text("Add To Cart",style: TextStyle(color: white,fontSize: 20,fontFamily: 'jml'),)
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    )
                  ],
                )

              ],
            ),
          );
        });

  }

}
