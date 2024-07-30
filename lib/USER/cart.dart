import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mywidget.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/delivery%20method.dart';

import '../CONSTANT/mycolor.dart';

class cart extends StatelessWidget {
  String userId;
   cart({super.key,required this.userId,});

  @override
  Widget build(BuildContext context ) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        iconTheme: IconThemeData(color: white),
        toolbarHeight: height/7.5,
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text("My Cart",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return value.cartList.isNotEmpty?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return SizedBox(

                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.cartList.length,
                        itemBuilder: (context, index) {
                          var item= value.cartList[index];

                          return Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.withOpacity(0.5),
                            ),

                            child: ListTile(
                              trailing: InkWell(
                                onTap: (){
                                  value.deletecartItem(context, userId,value.cartList[index].id);
                                  // back(context);
                                  // value.delete(value.getCartItems(context,userId[index].id);

                                },
                                  child: Icon(
                                       Icons.delete,color: Colors.red)),
                              leading: Container(height: 100,width: 85,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),color: Colors.black12,image: DecorationImage(
                                    image: NetworkImage(item.Image),fit: BoxFit.fill)),),
                              title: Text(item.Name,style: TextStyle(
                                  color: green2,fontFamily: 'jml',fontSize: 20),),
                              subtitle: Text( item.Price,style: TextStyle(
                                  color: Colors.red[300],fontSize: 19,fontFamily: 'jml'),),

                            ),

                          );

                        },),
                    );
                  }
                ),
                // SizedBox(height: 15,),
                Text("  Price Details",style: TextStyle(fontSize: 30,fontFamily: 'jml',color: green2),),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Price",style: TextStyle(fontFamily: 'jml',fontSize: 18,color: green2),),
                              Text("Rs ${value.totalItemPrice}",style: TextStyle(fontFamily: 'jml',fontSize: 18,color: green2),),

                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discount",style: TextStyle(fontFamily: 'jml',fontSize: 18,color: green2),),
                              Text("Rs ${value.discount}",style: TextStyle(fontFamily: 'jml',fontSize: 18,color: green2),),

                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Deposit",style: TextStyle(fontFamily: 'jml',fontSize: 18,color: green2),),
                              Text("Rs 4000",style: TextStyle(fontFamily: 'jml',fontSize: 18,color: green2),),

                            ],
                          ),
                        ],
                      );
                    }
                  ),
                ),
                SizedBox(height: 20,),
                Divider(height: 1,color: green2,thickness: 1,),
                SizedBox(height: 10,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("  Total Amound",style: TextStyle(fontSize: 28,fontFamily: 'jml',color: green2),),
                        Text("Rs ${value.overAlltotal}",style: TextStyle(fontFamily: 'jml',fontSize: 22,color: green2),),
                      ],
                    );
                  }
                ),
                SizedBox(height: 45,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 220),
                      child: InkWell(
                        onTap: (){
                          callNext(context, pickup(userId: userId, Price: value.totalItemPrice.toString(), image: value.ItemImage, ItemId: value.cartItemsList, overall: value.overAlltotal.toString(), Name: '', Phone: '',));
                        },
                        child: Container(height: 50,width: 160,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
                          child: Center(child: Text("Proceed",style: TextStyle(fontFamily: 'jml',color: white,fontSize: 23),)),
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(height: 100,),

              ],
            ):Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Center(child: Text("your cart is emprty...",style: TextStyle(fontFamily: 'jml',fontWeight: FontWeight.w600,color: green2,fontSize: 20),)),
              ],
            );
          }
        ),
      ),
    );
  }
}
