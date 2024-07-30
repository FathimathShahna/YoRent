import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/OTP.dart';
import 'package:yorent/USER/home.dart';

import '../ADMIN/admin_home.dart';
import '../USER/bottomnavigation_screen.dart';

class LoginProvider extends ChangeNotifier{
  FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController phoneController=TextEditingController();
TextEditingController otpController=TextEditingController();
String VerificationId='';

void sendotp(BuildContext context) async {
  await auth.verifyPhoneNumber(
    phoneNumber: "+91${phoneController.text}",
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == "invalid-phone-number") {
        print("provided phone number is invalid");
      }
    },
    codeSent: (String verificationId, int? resendToken) {
      VerificationId = verificationId;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => otp(),
          ));
      log("Verification Id : $verificationId");
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    timeout: const Duration(seconds: 60),
  );
}
  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpController.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {
        userAuthorisation(user.phoneNumber!,context);
      } else {
        if (kDebugMode) {
          print("6546");
        }
      }
    });

}

  Future<void> userAuthorisation(String phoneNumber,BuildContext context) async {
  String name="";
  String loginType="";
  String phoneNo="";
  String userId="";
  MainProvider mainProvider = Provider.of<MainProvider>(context,listen: false);
  try{
    var phone= phoneNumber!;
    db.collection("USERS").where("PHONE",isEqualTo: phone).get().then((value){
      if(value.docs.isNotEmpty){
        for(var e in value.docs){
          Map<dynamic,dynamic> map=e.data();
          name=map["USER_NAME"].toString();
          phoneNo=map["PHONE"].toString();
          loginType= map["TYPE"].toString();
          userId=e.id;
          notifyListeners();
          String id= userId;

          if(loginType=="USER"){
            db.collection("CUSTOMER_DETAILS").doc(userId).get().then((value) {
              if(value.exists){
                mainProvider.getCategoryList();
                mainProvider.getCartItems(userId);
                mainProvider.GetCustomerfn(userId);
                notifyListeners();
                callNextReplacement(context, Bottombar(userId: userId,Name: name,Phone: phoneNo,));

              }

            });
            

          }else{
            mainProvider.getCategoryList();

            callNextReplacement(context, AdminHomeScreen());
          }
        }
      }else{
        const snackBar = SnackBar(
            backgroundColor: Colors.white,
            duration: Duration(milliseconds: 3000),
            content: Text("Sorry , You don't have any access",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }catch (e){

  }

  }
}