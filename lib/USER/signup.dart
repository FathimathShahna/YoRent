import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/home.dart';
import 'package:yorent/USER/login.dart';

import '../CONSTANT/mycolor.dart';
import '../CONSTANT/mywidget.dart';

class signup extends StatelessWidget {

   signup({super.key,});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width,
      decoration:BoxDecoration(image: DecorationImage(image: AssetImage("assets/login.png"),fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: height/4,),

                Padding(
                  padding: const EdgeInsets.only(right: 140),
                  child: TXT('SIGNUP', green3, 45),
                ),
                Center(child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return container(Icons.person, txtclr, 'User Name',value.UserNameController);
                  }
                )),
                SizedBox(height: 10,),
                // Center(child: Consumer<MainProvider>(
                //   builder: (context,value,child) {
                //     return container(Icons.contact_page_outlined, txtclr, 'Email',value.UserEmailController);
                //   }
                // )),
                SizedBox(height: 10,),
                Center(child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return contnr('Phone', 40, FontWeight.bold, txtclr, Icons.phone,value.UserPhoneController);
                  }
                )),
                SizedBox(height: 15,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: (){value.Register("","NEW");
                        back(context);
                        },
                        child: mybtn(50, 170, 'Register', green2, 25, FontWeight.normal, white, 'jml'));
                  }

                ),
                SizedBox(height: height/6,),
                // btmTxt('Already have an account?' , 'LOGIN', context, signup()),
                InkWell(
                    onTap:(){
                      back(context, );
                    } ,
                    child: Text("Already have an account? LOGIN",
                      style: TextStyle(fontSize: 16,color: Colors.white),)

                )


              ],
            ),
          ),
        ),
      ),

    );
  }
}
