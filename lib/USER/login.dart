import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/CONSTANT/mycolor.dart';
import 'package:yorent/CONSTANT/mywidget.dart';
import 'package:yorent/PROVIDER/loginprovider.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/OTP.dart';
import 'package:yorent/USER/signup.dart';

class login extends StatelessWidget {

   login({super.key,});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;

    LoginProvider loginProvider=Provider.of<LoginProvider>(context,listen: false);
    return  Container(
      height: height,
      width: width,
      decoration:BoxDecoration(image: DecorationImage(image: AssetImage("assets/login.png"),fit: BoxFit.fill)),



      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child:
              Column(
                children: [
                  SizedBox(
                    height: 220,),

                  Padding(
                    padding: const EdgeInsets.only(right: 140),
                    child: TXT('LOGIN', green3, 45),
                  ),
                  Center(child: Consumer<LoginProvider>(
                    builder: (context,value,child) {
                      return contnr('Phone', 40, FontWeight.bold, txtclr, Icons.phone,value.phoneController);
                    }
                  )),
                  SizedBox(height: 15,),
                  InkWell(
                      onTap: (){
                        loginProvider.sendotp(context);
                      },
                      child: Consumer<LoginProvider>(
                        builder: (context,value,child) {
                          return mybtn(50, 170, 'Get OTP', green2, 25, FontWeight.normal, white, 'jml');
                        }
                      )),
                  SizedBox(height: height/3.5,),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      value.clearreg();
                      return btmTxt('Dont have an account?' , 'REGISTER', context, signup());
                    }
                  ),


                ],


            ),
          ),
        ),

      ),
    );
  }
}
