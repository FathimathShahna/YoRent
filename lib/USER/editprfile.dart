import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/profile.dart';

import '../CONSTANT/mycolor.dart';

class editprofile extends StatelessWidget {
  String userId;
   editprofile({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: height/2.5,
        backgroundColor: green2,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(29),bottomRight: Radius.circular(20))),
        leading: InkWell(
          onTap: (){
   back(context, );
          },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Icon(Icons.arrow_back,color: white,size: 25,),
            )),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Column(
              children: [
                Text("Edit Profile",style: TextStyle(color: white,fontSize: 30,fontFamily: 'jml'),),
                SizedBox(height: 30,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap:(){
                      showBottomSheet(context,);
                    },
                        child: value.fileprofileImage!=null?
                        CircleAvatar(radius: 50,backgroundColor: Colors.white,backgroundImage: FileImage(value.fileprofileImage!),):
                            value.profileImage!=""?
                            CircleAvatar(radius: 50,backgroundColor: Colors.white,backgroundImage: NetworkImage(value.profileImage!),):
                            CircleAvatar(radius: 50,backgroundColor: Colors.white,child: Icon(Icons.person_add,color: Colors.grey,),),

                    );


                  }
                )
              ],
            ),
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),

              Text("Name:",style: TextStyle(
                  color: green2,fontFamily: 'jml',fontSize: 25,fontWeight: FontWeight.w200),),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
              ),
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return TextFormField(controller: value.UserNameController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: 'jml'),
              // inputFormatters: [LengthLimitingTextInputFormatter(10)],
              decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: green1)),
              )
                    );
                  }
                ),
              ),
              SizedBox(height: 20,),
              Text("Mobile:",style: TextStyle(
                  color: green2,fontFamily: 'jml',fontSize: 25,fontWeight: FontWeight.w200),),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return TextFormField(enabled: false,
                      controller:value.UserPhoneController ,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontFamily: 'jml'),
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: green1)),
                        )
                    );
                  }
                ),
              ),
              SizedBox(height: 20,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Padding(
                    padding: const EdgeInsets.all(70),
                    child: GestureDetector(onTap: (){
                      value.Register(userId, "EDIT");
                      back(context);

                    },
                      child: Container(
                        height: 50,
                      width: 130,
                      decoration: BoxDecoration(color: green2,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [BoxShadow(blurRadius: 1)]
                      ),
                        child: Center(child: Text("Update",style: TextStyle(color: white,fontSize: 25,fontFamily: 'jml'),)),
                      ),
                    ),
                  );
                }
              )

            ],
          ),
        ),
      ),

    );
  }
  void showBottomSheet(BuildContext context,) {
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
                  onTap: () => {donationProvider.getProfileImagecamera(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: green2),
                  title: const Text('Gallery',),
                  onTap: () => {donationProvider.getProfileImagegallery(),Navigator.pop(context)}),
            ],
          );
        });

  }

}
