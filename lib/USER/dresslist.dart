import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/cart.dart';
import 'package:yorent/USER/itemdetail.dart';

import '../CONSTANT/mycolor.dart';

class dresslist extends StatelessWidget {
  String catId, subCatId,userId, Name;


  dresslist({super.key, required this.catId, required this.subCatId,required this.userId,required this.Name});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        iconTheme: IconThemeData(color: white),
        toolbarHeight: height / 7.5,
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return Column(
                children: [
                  Text(
                    Name,
                    style: TextStyle(
                        fontFamily: 'sarina', fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    "___find your dream dress___",
                    style: TextStyle(fontSize: 18, color: white, fontFamily: 'n1'),
                  )
                ],
              );
            }
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Consumer<MainProvider>(builder: (context, value, child) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.Itemlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                    childAspectRatio: .7,
                  ),
                  itemBuilder: (context, index) {
                    var item = value.Itemlist[index];

                    return InkWell(
                      onTap: () {
                        callNext(context, details(catId: catId,subCatId: subCatId,Name: item.Name,
                        Description: item.Description,Price: item.Price,Image: item.Image,ItemId: item.id,userId: userId,),);
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: green2,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                )
                              ]),

                          // padding: EdgeInsets.all(5),
                          // color of grid items
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0)),
                                  child: Image.network(
                                    item.Image,
                                    height: 180,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              Text(item.Name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'jml',
                                      color: white)),
                              // const SizedBox(
                              //   height: 8.0,
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("${item.Price}/-"
                                      "",
                                      style: TextStyle(

                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'jml',
                                          color: Colors.orange[200])),
                                  Consumer<MainProvider>(
                                    builder: (context,value,child) {
                                      return IconButton(
                                        onPressed: () {
                                          value.addToCart( catId, subCatId, context,item.id,userId,item.Name,item.Price,item.Image);

                                        },
                                        icon: Icon(Icons.shopping_cart_outlined),
                                        color: white,
                                      );
                                    }
                                  )
                                ],
                              )
                            ],
                          )),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
