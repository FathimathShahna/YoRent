import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mycolor.dart';
import 'package:yorent/PROVIDER/loginprovider.dart';

Widget contnr(String txt,double fontsz,FontWeight fontw8,Color mycolor,dynamic icn,TextEditingController contrlr ){
  return Container(
    height: 60,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),color:Color(0xffFDFDFD).withOpacity(.40),
    ),
    child:
      TextField(
        keyboardType: TextInputType.phone,
        controller: contrlr,
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
        decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(15),),
          hintText: "Phone",
          hintStyle: TextStyle(color: mycolor),
          prefixIcon: Icon(icn),
            prefixIconColor: mycolor
        ),
      ),


  );
}

//signup page

Widget container(dynamic icn,Color mycolor,String hintText,TextEditingController contrlr){
  return Container(
    height: 60,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),color:Color(0xffFDFDFD).withOpacity(.40),
    ),
    child:
    TextField(
      keyboardType: TextInputType.text,
      controller: contrlr,

      // controller: value.phoneController,
     // inputFormatters: [LengthLimitingTextInputFormatter(10)],
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(15),),
          hintText:hintText,
          hintStyle: TextStyle(color: mycolor),
          prefixIcon: Icon(icn),
          prefixIconColor: mycolor
      ),
    ),


  );
}

Widget mybtn(double height,double width,String txt,Color containercolor,
    double fontsz,FontWeight fontwgt,Color mycolor,String jml){
  return Container(
    height: height,
    width:width ,
    decoration: BoxDecoration(color: containercolor.withOpacity(.76),borderRadius: BorderRadius.circular(30) ),
    child: Center(
      child: Text(
        

        txt,
        style: TextStyle(fontSize:fontsz,fontWeight: fontwgt,color: mycolor ,fontFamily: jml),
      ),
    ),
  );
}
Widget TXT(String txt,Color mycolor,double fntsz){
  return Text(txt,style: TextStyle(color: mycolor,fontSize: fntsz),

  );
}
Widget btmTxt(String text1,String text2,context,call){
  return InkWell(
    onTap: (){
      callNext(context, call);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1,
        style: TextStyle(color: Colors.white,fontSize: 16,),
        ),
        Text(text2,
        style: TextStyle(color: Colors.white,fontSize: 16,
          decoration: TextDecoration.underline,
        decorationColor: Colors.white,
        ),
        )
      ],
    ),
  );
}
Widget otpcon( ){
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),color:Color(0xffFDFDFD).withOpacity(.40),
    ),
    child:
    TextField(
      keyboardType: TextInputType.phone,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
          // hintText: "Phone",
          // hintStyle: TextStyle(color: mycolor),
          // prefixIcon: Icon(icn),
          // prefixIconColor: mycolor
      ),
    ),


  );
}
// Widget stck(String img,Color mycolor,
//     //double lft,double top,double rgt,
//   String txt2,double top2,double left){
//   return Center(
//     child: SizedBox(
//       height: 250,
//       child: Stack(
//         children: [
//           Container(height: 190,
//           width: 290,
//             decoration: BoxDecoration(
//                 //image: DecorationImage(image: Image.network(item.Image,fit: BoxFit.fill,),
//                 borderRadius: BorderRadius.circular(20),
//               boxShadow: [BoxShadow(
//                 blurRadius: 2
//               )],
//             ),
//             child: Image.network(item.Image,fit: BoxFit.fill,),
//
//           ),
//
//           Positioned(top: top2,
//             left: left,
//             child: Container(
//              // padding: EdgeInsets.only(left: lft,top: top,right: rgt),
//               height: 48,
//               width: 230,
//               color: mycolor,
//               child: Center(
//                 child: Text(item.Name,style: TextStyle(
//                     fontSize: 35,fontWeight: FontWeight.w600,color: white,fontFamily: 'Sacramento'),),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
//
// Widget appbartxt(String txt3){
//   Text(txt3,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,fontFamily: 'sarina',color: Colors.black),
//   );
// }
Widget dresscont(String txt4,Color mycolor,double top3,double left3,String img){
  return Center(
    child: SizedBox(
      height: 250,
      child: Stack(
        children: [Container(
          height: 200,
          width: 160,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage (img),fit: BoxFit.cover),
              //color: Colors.blue,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80),topRight: Radius.circular(80)),
          boxShadow: [BoxShadow(blurRadius: 3),]
          ),

        ),
          Positioned(
            top: top3,
            left: left3,

            child: Container(
              height: 44,
              width: 147,
              color: mycolor,
              child: Center(
                child: Text(txt4,style: TextStyle(
                    fontSize: 28,fontWeight: FontWeight.w600,color: white,fontFamily: 'Sacramento'),),
              ),

            ),
          )
      ],
      ),
    ),
  );


}
Widget description(double wdth,String txt,String desptn,){
  return Container(
    height: 900,
    width: wdth,
    decoration: BoxDecoration(borderRadius: BorderRadius.only(
        topLeft: Radius.circular(80),topRight: Radius.circular(80)),
      color: white.withOpacity(50),
    ),
    child: Column(
      children: [
        Center(child: Text(txt,style: TextStyle(
            fontSize: 25,fontFamily: 'n1',color: green2,fontWeight: FontWeight.w900),)),
        SizedBox(height: 15,),
        Text('Description',style: TextStyle(color: green2,fontSize: 20,fontFamily: 'n1',fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
        Text(desptn,style: TextStyle(fontSize: 16,color: white,fontFamily: 'n1'),)
      ],
    ),
  );
}
Widget profiledit(String txt,dynamic icon){
  return Column(

    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(width: 20,),
               Icon(icon,size: 30,color: Colors.black38,),
              SizedBox(width: 30,),
              Text(txt,style: TextStyle(
                  fontSize: 27,fontWeight: FontWeight.w300,fontFamily: 'jml',color: Colors.black38),),
            ],
          ),
        ),
      ),
      //SizedBox(height: 10,),
      Divider(color: Colors.black38,thickness: 1,)
    ],
  );
}
Widget track(Color clr,dynamic icn,String txt1,String txt2){
  return  Row(
    children: [
      Column(
        children: [
          CircleAvatar(radius:30,
            backgroundColor: clr,
            child: Icon(icn,color: white,size: 40,),),
          Container(height: 85,width: 1,color: green2,)
        ],
      ),
      SizedBox(width:30),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(txt1,style: TextStyle(fontFamily: 'jml',fontSize: 20,color: green2),),
          Text(txt2,style: TextStyle(fontFamily: 'jml',fontSize: 15,
              color: Colors.orange[400]),),
        ],
      )
    ],
  );
}

