// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:provider/provider.dart';
// import 'package:yorent/CONSTANT/mycolor.dart';
// import 'package:yorent/PROVIDER/mainProvider.dart';
//
// class address extends StatelessWidget {
//   String userId;
//    address({super.key,required this.userId});
//   List<String> suggestion=[
//     'Maharashtra','Bihar','Chhattisgarh','Karnataka','Punjab','Andra Pradesh',
//     'Kerala','Goa','Mizoram','Arunanchal Pradesh','Assam','Manipur','Gujarat',
//     'Himanchal Pradesh','Jharkhand','Tripura','Madhya Pradesh','Tamil Nadu'
//         'Odisha','Nagaland', 'Telangana','Meghalaya','Uttar Pradesh','Sikkim',
//     'Uttarakhand','West Bengal','Haryana','Rajastan','Delhi','Jmmu & Kashmir'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     // return Autocomplete<String>(
//     //     optionsBuilder: (TextEditingValue textEditingValue){
//     //       if(textEditingValue.text==''){
//     //         return const Iterable<String>.empty();
//     //       }
//     //       return state.where((String item) {
//     //         return item.contains(textEditingValue.text.toLowerCase());
//     //       });
//     //     },
//     //     onSelected: (String item){
//     //       print('The $item was selected');
//     //     },
//
//         var height=MediaQuery.of(context).size.height;
//         var width=MediaQuery.of(context).size.width;
//     return  Scaffold(
//       appBar: AppBar(
//         backgroundColor: green2,
//         iconTheme: IconThemeData(color: white),
//         toolbarHeight: height/7.5,
//       title: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Text("Address",style: TextStyle(fontSize: 32,color: white,fontFamily: 'jml'),),
//       ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: Column(
//              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children:<Widget> [
//               SizedBox(height: 10,),
//               Text("Address:",style: TextStyle(color: green3,fontFamily: 'jml',fontSize: 18),),
//               Consumer<MainProvider>(
//                 builder: (context,value,child) {
//                   return SizedBox(height: 40,width: width,
//                     child: TextFormField(
//                       decoration: InputDecoration(border: InputBorder.none,
//                           hintText: 'Enter your address',
//                         hintStyle:  TextStyle(fontSize: 15,color: Colors.grey[400])
//                       ),
//                        controller: value.AddressController,style: TextStyle(color: green2,fontSize: 18,fontFamily: 'jml',
//                         fontWeight: FontWeight.w400),),
//                   );
//                 }
//               ),
//               SizedBox(height: 10,),
//               Divider(height: 1,color: green2,thickness: 1,),
//               //SizedBox(height: 10,),
//               Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("District:",style: TextStyle(color: green3,fontFamily: 'jml',fontSize: 18),),
//                       Consumer<MainProvider>(
//                           builder: (context,value,child) {
//                             return SizedBox(height:60,width: width/2.5,
//                               child: TextFormField(controller: value.DistrictController,
//                                 maxLines: 3,
//                                 cursorHeight: 30,
//                                 style: TextStyle(
//                                     color: green2,fontSize: 18,fontFamily: 'jml',
//                                     fontWeight: FontWeight.w400),
//                                 decoration: InputDecoration(border: InputBorder.none,
//                                     hintText: 'Enter your district',
//                                     hintStyle:  TextStyle(fontSize: 15,color: Colors.grey[400])
//                                 ),),
//                             );
//                           }
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: width/3.5,),
//                   Column(
//                     children: [
//                       Text("Zip Code:",style: TextStyle(color: green3,fontFamily: 'jml',fontSize: 18),),
//                       Consumer<MainProvider>(
//                           builder: (context,value,child) {
//                             return SizedBox(height: 40,width: 80,
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 controller: value.PinController,
//                                 style: TextStyle(color: green2,fontSize: 18,fontFamily: 'jml',
//                                     fontWeight: FontWeight.w400),
//                                 decoration: InputDecoration(border: InputBorder.none,
//                                   hintText:'000000',
//                                   hintStyle: TextStyle(fontSize: 15,color: Colors.grey[400])
//                                 ),),
//                             );
//                           }
//                       ),
//                     ],
//                   ),
//                   //SizedBox(height: 80,),
//                 ],
//               ),
//               SizedBox(height: 10,),
//               Divider(height: 1,color: green2,thickness: 1,),
//               SizedBox(height: 10,),
//               Text(
//                 "City:",style: TextStyle(color: green3,fontFamily: 'jml',fontSize: 18),),
//               Consumer<MainProvider>(
//                 builder: (context,value,child) {
//                   return SizedBox(height: 40,width: width,
//                     child: TextFormField(
//                       controller: value.CityController,
//                       style: TextStyle(color: green2,fontSize: 18,fontFamily: 'jml',
//               fontWeight: FontWeight.w400),
//                     decoration: InputDecoration(border: InputBorder.none,
//                         hintText: 'Enter your city',
//                         hintStyle:  TextStyle(fontSize: 15,color: Colors.grey[400])
//                     ),),
//                   );
//                 }
//               ),
//               SizedBox(height: 10,),
//               Divider(height: 1,color: green2,thickness: 1,),
//               SizedBox(height: 10,),
//               Text("Your Email:",style: TextStyle(color: green3,fontFamily: 'jml',fontSize: 18),),
//               SizedBox(height: 10,),
//               Consumer<MainProvider>(
//                 builder: (context,value,child) {
//                   return SizedBox(height: 40,width: width,
//                     child: TextFormField(controller: value.EmailController,
//                       style: TextStyle(color: green2,fontSize: 18,fontFamily: 'jml',
//                         fontWeight: FontWeight.w400),decoration: InputDecoration(border: InputBorder.none,
//                           hintText: '***********@gmail.com',
//                           hintStyle:  TextStyle(fontSize: 15,color: Colors.grey[400])
//                       ),),
//                   );
//                 }
//               ),
//
//               SizedBox(height: 10,),
//               Divider(height: 1,color: green2,thickness: 1,),
//               SizedBox(height: 10,),
//           Text(
//             "State:",
//             style: TextStyle(color: green3, fontFamily: 'jml', fontSize: 18),
//           ),
//   //         SizedBox(
//   //           width: width / 1.2,
//   //           child: TypeAheadField(
//   //             textFieldConfiguration: TextFieldConfiguration(
//   //               decoration: InputDecoration(
//   //                 labelText: 'Type a fruit',
//   //                 border: OutlineInputBorder(),
//   //               ),
//   //             ),
//   //             suggestionsCallback: (pattern) {
//   //               return state.where((fruit) =>
//   //                   fruit.toLowerCase().contains(pattern.toLowerCase()));
//   //             },
//   //             itemBuilder: (context, suggestion) {
//   //               return ListTile(
//   //                 title: Text(suggestion),
//   //               );
//   //             },
//   //             onSuggestionSelected: (suggestion) {
//   //               // Do something when a suggestion is selected
//   //               print('Selected: $suggestion');
//   //             },
//   //           ),
//   //         ),
//   //               // DropdownButton(
//   //               //   isExpanded: true,
//   //               //     underline: SizedBox(),
//   //               //     value: dropDownvalue,
//   //               //     icon: const Icon(Icons.keyboard_arrow_down,size: 30,),
//   //               //     items: state.map((String state) {
//   //               //       return DropdownMenuItem(
//   //               //         value: state,
//   //               //         child: Text(state,style: TextStyle(color: green2,fontSize: 18,fontFamily: 'jml',
//   //               //                   fontWeight: FontWeight.w400),),
//   //               //       );
//   //               //     }).toList(),
//   //               //     onChanged: (String ?newValue){
//   //               //     }),
//   //             ),
//   //             SizedBox(height: 10,),
//   //             Divider(height: 1,color: green2,thickness: 1,),
//   //             SizedBox(height: 50,),
//   //             Center(
//   //               child: Consumer<MainProvider>(
//   //                 builder: (context,value,child) {
//   //                   return InkWell(
//   //                     onTap: (){value.addAddress(userId);},
//   //                     child: Container(height: 50,width: 140,
//   //                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: green2),
//   //                       child: Center(child: Text("Update",style: TextStyle(fontFamily: 'jml',color: white,fontSize: 25),)),
//   //                     ),
//   //                   );
//   //                 }
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     )
//   //   );
//   // }
// }
