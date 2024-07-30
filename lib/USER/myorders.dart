import 'package:flutter/material.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/USER/tracking.dart';

import '../CONSTANT/mycolor.dart';

class myorder extends StatelessWidget {
  const myorder({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green2,
        iconTheme: IconThemeData(color: white),
        toolbarHeight: height/7.5,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("My Orders",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
        ),
      ),
      body:ListView.builder(itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
              bottomLeft: Radius.circular(45),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8)
            ),

              color: Colors.grey.withOpacity(0.5),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 48,
                  foregroundImage: AssetImage('assets/saree.jpg',),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Designer Saree",style: TextStyle(
                        color: green2,fontFamily: 'jml',fontSize: 20),),
                    SizedBox(
                      width: 150,
                      child: Text("Price: 1890",style: TextStyle(
                          color: Colors.orangeAccent,fontSize: 19,fontFamily: 'jml'),),
                    ),
                    SizedBox(height: 5,),
                    Row(
                       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 25,width: 90,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.red,),child: Center(
                            child: Text('Cancel Order',style: TextStyle(color: Colors.white,fontFamily: 'jml',fontSize: 12),)),),
                        Container(height: 25,width: 90,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.green,),child: Center(
                            child: Text('View Details',style: TextStyle(color: Colors.white,fontFamily: 'jml',fontSize: 12),)),),
                        Container(
                            height: 25,width: 50,decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: green2
                        ),
                            child: Center(child: InkWell(
                                onTap: (){callNext(context, tracking());},
                                child: Text("Track",style: TextStyle(color: white,fontFamily: 'jml',fontSize: 12),)))),
                      ],
                    ),
                  ],
                ),
              ],
              // Container(height: 85,width: 75,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),color: Colors.black12,image: DecorationImage(
              //       image: AssetImage('assets/saree.jpg'),fit: BoxFit.fill)),),


            ),

          );

      },)

      // body:
      // DefaultTabController(
      //   length: 2,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       SizedBox(
      //         height: 170,
      //         child: Stack(
      //           children: [
      //             Container(height: 130,
      //               width: width,
      //               decoration: BoxDecoration(borderRadius: BorderRadius.only(
      //                 bottomLeft: Radius.circular(23),bottomRight: Radius.circular(23
      //               ),
      //               ),
      //                 color: green2,),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Row(
      //                   children: [
      //                     Icon(Icons.arrow_back,color: white,),
      //                     SizedBox(width: 30,),
      //                     Text("My Orders",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
      //                   ],
      //                 ),
      //               ),),
      //             Positioned(
      //                 top: 105,
      //                 left: 28,
      //                 child: Container(height: 40,width: width/1.2,
      //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      //                     color: Colors.grey,),
      //                   child: TabBar(tabs: [
      //                     Tab(text: 'Pick Up',),
      //                     Tab(text: 'Delvery',),
      //                   ]),
      //                 )
      //             )
      //           ],
      //         ),
      //       ),
      //       Expanded(
      //         child: TabBarView(children: [
      //           SingleChildScrollView(
      //             child:
      //             Padding(
      //               padding: const EdgeInsets.all(15),
      //               child: Column(
      //                 //mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   //mainAxisAlignment: MainAxisAlignment.start,
      //                   Text('Items',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: green2,fontFamily: 'jml'),),
      //                   Consumer<MainProvider>(
      //                       builder: (context,value,child) {
      //                         return  ListView.builder(
      //                           shrinkWrap: true,
      //                           itemCount: value.cartList.length,
      //                           itemBuilder: (context, index) {
      //                             var item= value.cartList[index];
      //                             return Container(
      //                               margin: EdgeInsets.all(8),
      //                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      //                                 color: Colors.grey.withOpacity(0.5),
      //                               ),
      //                               child: ListTile(
      //                                 leading: Container(height: 100,width: 75,
      //                                   decoration: BoxDecoration(
      //                                       borderRadius: BorderRadius.circular(15),color: Colors.black12,image: DecorationImage(
      //                                       image: NetworkImage(item.Image),fit: BoxFit.cover)),),
      //                                 title: Text(item.Name,style: TextStyle(
      //                                     color: green2,fontFamily: 'jml',fontSize: 20),),
      //                                 subtitle: Text(item.Price,style: TextStyle(
      //                                     color: Colors.red[300],fontSize: 19,fontFamily: 'jml'),),
      //                               ),
      //                             );
      //                           },);
      //                       }
      //                   ),
      //                   SizedBox(height: 20,),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Consumer<MainProvider>(
      //                         builder: (context,value,child) {
      //                           print(value.fromDate.toString()+"chbjnkj");
      //                           return Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Text("Choose a Date",style: TextStyle(color: green2,fontSize: 20,fontFamily: 'jml'),),
      //                               InkWell(
      //                                 onTap: (){
      //                                   value.selectFromDate(context);
      //                                 },
      //                                 child: Container(height: 30,width: 120,
      //                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      //                                       color: Colors.grey,
      //                                       border: Border.all(color: green2)
      //                                   ),
      //                                   child:Center(
      //                                       child: Text(
      //                                         // value.fromDate? 'dd-MM-yyyy': DateFormat('dd-MM-yyyy'):DateFormat('dd-MM-yyyy').format(value.fromDate))
      //                                           value.fromDate==DateTime.now()?'dd/MM/yyyy':DateFormat('dd-MM-yyyy').format(value.fromDate))
      //                                   ),),
      //                               )
      //                             ],
      //                           );
      //                         }
      //                     ),
      //                   ),
      //                   SizedBox(height: 20,),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Consumer<MainProvider>(
      //                         builder: (context,value,child) {
      //                           return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Text("Return Date",style: TextStyle(color: green2,fontSize: 20,fontFamily: 'jml'),),
      //                               InkWell(
      //                                 onTap:(){
      //                                   value.selectToDate(context);
      //                                 },
      //                                 child: Container(height: 30,width: 120,
      //                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      //                                     color: Colors.grey,
      //                                     border: Border.all(color: green2),
      //                                   ),
      //                                   child:  Center(
      //                                       child: Text(
      //                                           value.returnDate==DateTime.now()?'dd/MM/yyyy':DateFormat('dd-MM-yyyy').format(value.returnDate))
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           );
      //                         }
      //                     ),
      //                   ),
      //                   SizedBox(height: 30,),
      //                   Center(
      //                     child: Consumer<MainProvider>(
      //                         builder: (context,value,child) {
      //                           return InkWell(
      //                             onTap:() {
      //                               print("hvbmn"+Name.toString());
      //                               value.addPickupOrders(userId, context,value.cartItemsList, Name,Price,image,overall);
      //                               value.cartList.clear();
      //                               value.clearpaymentdetails();
      //                               value.deleteafterorder(context, userId, ItemId);
      //                               // value.fromDate=null;
      //                               showDialog(
      //                                   context: context, builder: (context){
      //                                 return BackdropFilter(
      //                                   filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10,),
      //                                   child: AlertDialog(
      //                                     backgroundColor: green2,
      //                                     title: Column(
      //                                       children: [
      //                                         CircleAvatar(backgroundColor: white,radius: 35,child: Icon(Icons.done,color: green2,size: 40,),),
      //                                         SizedBox(height: 20,),
      //                                         Text('Order Confirmed',style: TextStyle( color: white,fontSize: 24,fontFamily: 'jml',fontWeight: FontWeight.w500),),
      //                                         SizedBox(height: 15,),
      //                                         Text('Your item will be available\nin the given date and time',style: TextStyle(
      //                                             color: white,fontFamily: 'jml',fontSize: 17),),
      //
      //                                         // TextButton(onPressed: callNext(context, home()), child: Text('Continue Shopping'))
      //                                       ],
      //                                     ),
      //                                     actions: [
      //                                       TextButton(onPressed: (){
      //                                         fromDate=DateTime.now();
      //                                         returnDate=DateTime.now();
      //                                         callNext(context, cart(userId: userId));
      //                                       }, child:  Container(height: 40,width: 200,
      //                                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: white),
      //                                         child: Center(child: Text('Continue Shopping',style: TextStyle(fontSize: 18,fontFamily:'jml',color: green2),)),))
      //                                     ],
      //                                   ),
      //                                 );
      //                               });
      //                             },
      //                             child: Container(
      //                               height: 50,
      //                               width: 150,
      //                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: green2,),
      //                               child: Center(child: Text("Confirm",style: TextStyle(fontFamily: 'jml',color: white,fontSize: 23),)),
      //                             ),
      //                           );
      //                         }
      //                     ),
      //                   ),
      //                   SizedBox(height: 40,),
      //                 ],
      //               ),
      //             ),
      //
      //
      //           ),
      //           SingleChildScrollView(
      //             child: Padding(
      //               padding: const EdgeInsets.all(15),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text('Items',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: green2,fontFamily: 'jml'),),
      //                   ListView.builder(
      //                     shrinkWrap: true,
      //                     itemCount: 2,
      //                     itemBuilder: (context, index) {
      //                       return Container(
      //                         margin: EdgeInsets.all(8),
      //
      //
      //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      //                           color: Colors.grey.withOpacity(0.5),
      //                         ),
      //
      //                         child: ListTile(
      //                           leading: Container(height: 100,width: 75,
      //                             decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.circular(15),color: Colors.black12,image: DecorationImage(
      //                                 image: AssetImage('assets/saree.jpg'),fit: BoxFit.cover)),),
      //                           title: Text("Designer Saree",style: TextStyle(
      //                               color: green2,fontFamily: 'jml',fontSize: 20),),
      //                           subtitle: Text("price: 190",style: TextStyle(
      //                               color: Colors.red[300],fontSize: 19,fontFamily: 'jml'),),
      //
      //                         ),
      //
      //                       );
      //
      //                     },),
      //                   SizedBox(height: 10,),
      //                   Text('Delivery Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: green2,fontFamily: 'jml'),),
      //                   SizedBox(height: 15,),
      //                   Container(height: 70,width: width/1.1,
      //                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Row(
      //                         children: [
      //                           Icon(Icons.location_on_outlined,color: Colors.white,),
      //                           SizedBox(width: 30,),
      //                           Text('Perinthalmanna',style: TextStyle(color: white,fontSize: 18,fontFamily: 'jml'),)
      //                         ],),
      //                     ),
      //                   ),
      //                   SizedBox(height: 20,),
      //                   Text('Payment Method',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: green2,fontFamily: 'jml'),),
      //                   SizedBox(height: 20,),
      //                   Container(height: 200,width: width/1.1,
      //                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Row(
      //                         children: [
      //                           // Icon(Icons.location_on_outlined,color: Colors.white,),
      //                           // SizedBox(width: 30,),
      //                           // Text('Perinthalmanna',style: TextStyle(color: white,fontSize: 18,fontFamily: 'jml'),)
      //                         ],),
      //                     ),
      //                   ),
      //                   SizedBox(height: 30,),
      //
      //                   Center(
      //                     child: Container(height: 50,
      //                       width: 150,
      //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: green2,),
      //                       child: Center(child: Text("Confirm",style: TextStyle(fontFamily: 'jml',color: white,fontSize: 23),)),
      //                     ),
      //                   ),
      //                 ],),
      //             ),
      //           ),
      //         ]  ),
      //       ),
      //
      //     ],
      //   ),
      // ),


    );
  }
}
