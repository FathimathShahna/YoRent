import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';
import 'package:yorent/ADMIN/items.dart';
import 'package:yorent/CONSTANT/callFunctions.dart';
import '../CONSTANT/mycolor.dart';
import '../MODELCLASS/modelclass.dart';
class MainProvider extends ChangeNotifier {
 final FirebaseFirestore db = FirebaseFirestore.instance;
 // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 Reference imgstrg = FirebaseStorage.instance.ref("Images");

 File? fileCategoryImage;

 List<categoryModel> categorylist = [];
 String image = '';

 File? fileSubCategoryImage;
 List<subCategoryModel> Subcategorylist = [];
 String Imageurl = "";

 File? fileItemImage;
 List<ItemModel> Itemlist = [];

 String ItemImage="";

 File? fileCartImage;
 List<CartModel> cartList = [];

 String CartImage="";


 TextEditingController categoryNameController = TextEditingController();

 Future<void> addCategory(String from, String categoryid) async {
  String id = DateTime
      .now()
      .microsecondsSinceEpoch
      .toString();
  HashMap<String, Object>addCtgryMap = HashMap();

  addCtgryMap["CATEGORY_NAME"] = categoryNameController.text.toString();
  addCtgryMap["CATEGORY_ID"] = id;
  addCtgryMap["ADDED_BY"] = "";
  addCtgryMap["TIME"] = DateTime.now();



  if (fileCategoryImage != null) {
   String photoId = DateTime
       .now()
       .microsecondsSinceEpoch
       .toString();
   imgstrg = FirebaseStorage.instance.ref().child(photoId);
   await imgstrg.putFile(fileCategoryImage!).whenComplete(() async {
    await imgstrg.getDownloadURL().then((value) {
     addCtgryMap["IMAGE"] = value;

     notifyListeners();
    });
    notifyListeners();
   });
   notifyListeners();
  }
  else {
   addCtgryMap["IMAGE"] = image;
  }
  if (from == "NEW") {
   db.collection("CATEGORIES").doc(id).set(addCtgryMap);
  } else {
   db.collection("CATEGORIES").doc(categoryid).update(addCtgryMap);
  }

  getCategoryList();


  notifyListeners();
 }

 void setImage(File image) {
  fileCategoryImage = image;
  print("234567sdfg" + fileCategoryImage.toString());

  notifyListeners();
 }

 Future getImagegallery() async {
  final imagePicker = ImagePicker();
  final pickedImage =
  await imagePicker.pickImage(source: ImageSource.gallery);
  print(pickedImage?.path.toString());
  if (pickedImage != null) {
   print("hjkl" + pickedImage.path);

   cropImage(pickedImage.path, "");
  } else {
   print('No image selected.');
  }
 }

 Future getImagecamera() async {
  final imagePicker = ImagePicker();
  final pickedImage =
  await imagePicker.pickImage(source: ImageSource.camera);

  if (pickedImage != null) {
   // print("dfghjk"+pickedImage.path);
   cropImage(pickedImage.path, "");
  } else {
   print('No image selected.');
  }
 }

 Future<void> cropImage(String path, String from) async {
  final croppedFile = await ImageCropper().cropImage(
   sourcePath: path,
   aspectRatioPresets: Platform.isAndroid
       ? [
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
   ]
       : [
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio5x3,
    CropAspectRatioPreset.ratio5x4,
    CropAspectRatioPreset.ratio7x5,
    CropAspectRatioPreset.ratio16x9,
    CropAspectRatioPreset.ratio16x9
   ],
   uiSettings: [
    AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.white,
        toolbarWidgetColor: Colors.black,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false),
    IOSUiSettings(
     title: 'Cropper',
    )
   ],
  );
  if (croppedFile != null) {
   fileCategoryImage = File(croppedFile.path);
   // print(Registerfileimg.toString() + "fofiifi");
   notifyListeners();
  }
 }

 void clearfunction() {
  categoryNameController.clear();
  fileCategoryImage = null;
  image = "";
 }

 void getCategoryList() {
  db.collection("CATEGORIES").get().then((value) {
   if (value.docs.isNotEmpty) {
    categorylist.clear();
    for (var value in value.docs) {
     categorylist.add(categoryModel(
         value.id,
         value.get("CATEGORY_NAME").toString(),
         value.get("IMAGE").toString()));

     notifyListeners();
    }
    print(categorylist.length.toString()+"ftft") ;

   }
   notifyListeners();
  });
 }

 void EditGetData(String categoryid) {
  db.collection("CATEGORIES").doc(categoryid).get().then((value) {
   if (value.exists) {
    Map<dynamic, dynamic> map = value.data() as Map;
    categoryNameController.text = map["CATEGORY_NAME"].toString();
    image = map["IMAGE"].toString();
    notifyListeners();
   }
  });
 }

 void delete(categoryid, context) {
  db.collection("CATEGORIES").doc(categoryid).delete();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
   shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
   content: Center(child: Text(
    'Deleted', style: TextStyle(color: white, fontFamily: 'jml', fontSize: 20
   ),)),
   backgroundColor: green2,));
  getCategoryList();
  notifyListeners();
 }



 TextEditingController SubCategoryNameController = TextEditingController();

 Future<void> addSubCategory(String editId,  String catId,context,String from2,) async {
  String cid = DateTime
      .now()
      .microsecondsSinceEpoch
      .toString();
  HashMap<String, Object>addSubCategoryMap = HashMap();
  addSubCategoryMap["SUB_CATEGORY_NAME"] = SubCategoryNameController.text.toString();
  addSubCategoryMap["CATEGORY_ID"] = catId;
  addSubCategoryMap["ADDED_BY"] = "";
  if(from2=="NEW"){
   addSubCategoryMap["SUBCATEGORY_ID"] = cid;

  }
  addSubCategoryMap["TIME"] = DateTime.now();


  if (fileSubCategoryImage != null) {
   String photoId = DateTime
       .now()
       .microsecondsSinceEpoch
       .toString();
   imgstrg = FirebaseStorage.instance.ref().child(photoId);
   await imgstrg.putFile(fileSubCategoryImage!).whenComplete(() async {
    await imgstrg.getDownloadURL().then((value) {
     addSubCategoryMap["IMAGE"] = value;
     notifyListeners();
    });
    notifyListeners();
   });
   notifyListeners();
  }
  else{
   addSubCategoryMap["IMAGE"]=image;
  }
  if(from2=="NEW"){
   db.collection("SUB_CATEGORIES").doc(cid).set(addSubCategoryMap);
  }else{
   db.collection("SUB_CATEGORIES").doc(editId).update(addSubCategoryMap);
  }
  getSubCategory(catId);
  notifyListeners();
  // finish(context);
 }

 void setSubCategoryImage(File image) {
  fileSubCategoryImage = image;
  print("234567sdfg" + fileSubCategoryImage.toString());

  notifyListeners();
 }

 Future getSubImagegallery() async {
  final imagePicker = ImagePicker();
  final pickedImage =
  await imagePicker.pickImage(source: ImageSource.gallery);
  print(pickedImage?.path.toString());
  if (pickedImage != null) {
   print("hjkl" + pickedImage.path);

   cropsubCategoryImage(pickedImage.path, "");
  } else {
   print('No image selected.');
  }
 }

 Future getSubImagecamera() async {
  final imagePicker = ImagePicker();
  final pickedImage =
  await imagePicker.pickImage(source: ImageSource.camera);

  if (pickedImage != null) {
   // print("dfghjk"+pickedImage.path);
   cropsubCategoryImage(pickedImage.path, "");
  } else {
   print('No image selected.');
  }
 }


 Future<void> cropsubCategoryImage(String path, String from) async {
  final croppedFile = await ImageCropper().cropImage(
   sourcePath: path,
   aspectRatioPresets: Platform.isAndroid
       ? [
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
   ]
       : [
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio5x3,
    CropAspectRatioPreset.ratio5x4,
    CropAspectRatioPreset.ratio7x5,
    CropAspectRatioPreset.ratio16x9,
    CropAspectRatioPreset.ratio16x9
   ],
   uiSettings: [
    AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.white,
        toolbarWidgetColor: Colors.black,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false),
    IOSUiSettings(
     title: 'Cropper',
    )
   ],
  );
  if (croppedFile != null) {
   fileSubCategoryImage = File(croppedFile.path);
   // print(Registerfileimg.toString() + "fofiifi");
   notifyListeners();
  }
 }

 void subctgryclearfunction() {
  SubCategoryNameController.clear();
  fileSubCategoryImage = null;
  image = "";
 }

 void getSubCategory(String catId) {
  Subcategorylist.clear();

  db.collection("SUB_CATEGORIES").where("CATEGORY_ID", isEqualTo: catId).get().then((value) {
   if (value.docs.isNotEmpty) {
    Subcategorylist.clear();
    for (var value in value.docs) {
     Subcategorylist.add(
         subCategoryModel(value.id, value.get("SUB_CATEGORY_NAME").toString(),
          value.get("IMAGE").toString(),));
     notifyListeners();
    }
    notifyListeners();
   }
   notifyListeners();
  });
 }

 void EditSubGetData(String SubCtgryid) {
  db.collection("SUB_CATEGORIES").doc(SubCtgryid).get().then((value) {
   if (value.exists) {
    Map<dynamic, dynamic> map = value.data() as Map;
    SubCategoryNameController.text = map["SUB_CATEGORY_NAME"].toString();
    Imageurl = map["IMAGE"].toString();
    notifyListeners();
   }
  });
 }

 void deleteSubcat(Subcategoryid, context, id) {
  db.collection("SUB_CATEGORIES").doc(Subcategoryid).delete();
  notifyListeners();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
   shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
   content: Center(child: Text(
    'Deleted', style: TextStyle(color: white, fontFamily: 'jml', fontSize: 20
   ),
   ),
   ),
   backgroundColor: green2,));
  getSubCategory(id);
  notifyListeners();
 }



 TextEditingController ItemNameController = TextEditingController();
 TextEditingController DescriptionController = TextEditingController();
 TextEditingController PriceController = TextEditingController();


 Future<void> addItem(String catid, String subcatid,BuildContext context,String fromItem,String iditem) async {
  String Itemid = DateTime
      .now()
      .microsecondsSinceEpoch
      .toString();
  HashMap<String, Object>addItemMap = HashMap();
  addItemMap["ITEM_NAME"] = ItemNameController.text.toString();
  addItemMap["DESCRIPTION"] = DescriptionController.text.toString();
  addItemMap["PRICE"] = PriceController.text.toString();
  addItemMap["ITEM_ID"] = Itemid;
  addItemMap["ADDED_BY"] = "";
  addItemMap["CATEGORY_ID"] = catid;
  addItemMap["SUBCATEGORY_ID"] = subcatid;

  addItemMap["TIME"] = DateTime.now();


  if (fileItemImage != null) {
   String photoId = DateTime
       .now()
       .microsecondsSinceEpoch
       .toString();
   imgstrg = FirebaseStorage.instance.ref().child(photoId);
   await imgstrg.putFile(fileItemImage!).whenComplete(() async {
    await imgstrg.getDownloadURL().then((value) {
     addItemMap["IMAGE"] = value;
     notifyListeners();
    });
    notifyListeners();
   });
   notifyListeners();
  }
  if(fromItem=="NEW"){
   db.collection("ITEMS").doc(Itemid).set(addItemMap);
  }else{
   db.collection("ITEMS").doc(iditem).update(addItemMap);
  }


  getItems(catid,subcatid);

  notifyListeners();
  // finish(context);

 }

 // void setItemImage(File image) {
 //  fileItemImage = image;
 //  print("234567sdfg"+fileItemImage.toString());
 //
 //  notifyListeners();
 // }

 Future getItemImagegallery() async {
  final imagePicker = ImagePicker();
  final pickedImage =
  await imagePicker.pickImage(source: ImageSource.gallery);
  print(pickedImage?.path.toString());
  if (pickedImage != null) {
   print("hjkl" + pickedImage.path);

   cropItemImage(pickedImage.path, "");
  } else {
   print('No image selected.');
  }
 }

 Future getItemImagecamera() async {
  final imagePicker = ImagePicker();
  final pickedImage =
  await imagePicker.pickImage(source: ImageSource.camera);

  if (pickedImage != null) {
   // print("dfghjk"+pickedImage.path);
   cropItemImage(pickedImage.path, "");
  } else {
   print('No image selected.');
  }
 }

 Future<void> cropItemImage(String path, String from) async {
  final croppedFile = await ImageCropper().cropImage(
   sourcePath: path,
   aspectRatioPresets: Platform.isAndroid
       ? [
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
   ]
       : [
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio5x3,
    CropAspectRatioPreset.ratio5x4,
    CropAspectRatioPreset.ratio7x5,
    CropAspectRatioPreset.ratio16x9,
    CropAspectRatioPreset.ratio16x9
   ],
   uiSettings: [
    AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.white,
        toolbarWidgetColor: Colors.black,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false),
    IOSUiSettings(
     title: 'Cropper',
    )
   ],
  );
  if (croppedFile != null) {
   fileItemImage = File(croppedFile.path);
   // print(Registerfileimg.toString() + "fofiifi");
   notifyListeners();
  }
 }

 void Itemclearfunction() {
  ItemNameController.clear();
  DescriptionController.clear();
  PriceController.clear();
  fileItemImage = null;
  ItemImage = "";
  notifyListeners();
 }

 bool loader=false;
 void getItems(String catId, String subCatId) {
  loader = true;
  notifyListeners();
  Itemlist.clear();
print(catId.toString()+"dduddh");
print(subCatId.toString()+"nnckcd");
  db.collection("ITEMS")
      .where("CATEGORY_ID", isEqualTo: catId,)
      .where("SUBCATEGORY_ID", isEqualTo: subCatId)
      .get()
      .then((value) {
   loader =false;
   notifyListeners();
   if (value.docs.isNotEmpty) {

    for (var e in value.docs) {
     print(e.id.toString()+"cjcv");
     Map<String,dynamic> map= e.data();
     Itemlist.add(ItemModel(
         e.id,
         map["ITEM_NAME"].toString(),
         map["DESCRIPTION"].toString(),
         map["PRICE"].toString(),
         map["IMAGE"].toString(),
     ));
     notifyListeners();
    }
   }

   notifyListeners();
  });
 }

 void EditItems(String Itemid) {
  db.collection("ITEMS").doc(Itemid).get().then((value) {
   if (value.exists) {
    Map<dynamic, dynamic> map = value.data() as Map;
    ItemNameController.text = map["ITEM_NAME"].toString();
    DescriptionController.text=map["DESCRIPTION"].toString();
    PriceController.text=map["PRICE"].toString();
    ItemImage = map["IMAGE"].toString();
    notifyListeners();
   }
  });
 }
 void deleteItem(String Itemid,BuildContext context,String catId, String subCatId) {
  db.collection("ITEMS").doc(Itemid).delete();
  //notifyListeners();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
   shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
   content: Center(child: Text(
    'Deleted', style: TextStyle(color: white, fontFamily: 'jml', fontSize: 20
   ),
   ),
   ),
   backgroundColor: green2,));
  getItems( catId,  subCatId);

  notifyListeners();
 }

//getItem
 void getItemdetails(String catId,String subcatid) {
  Itemlist.clear();

  db.collection("ITEMS")
      .where("CATEGORY_ID", isEqualTo: catId)
      .where("SUBCATEGORY_ID", isEqualTo: subcatid)
      .get().then((value) {
   if (value.docs.isNotEmpty) {
    Itemlist.clear();
    for (var value in value.docs) {
     Itemlist.add(
         ItemModel(value.id, value.get("ITEM_NAME").toString(),
          value.get("DESCRIPTION").toString(),
          value.get("PRICE").toString(),
         value.get("IMAGE").toString()));
     notifyListeners();
    }
    notifyListeners();
   }
   notifyListeners();
  });
 }

 //Register
TextEditingController UserNameController=TextEditingController();
TextEditingController UserPhoneController=TextEditingController();
Future<void> Register(String userId,String from) async {
 String id=DateTime.now().microsecondsSinceEpoch.toString();
 HashMap<String,Object>RegisterMap=HashMap();

 RegisterMap["NAME"]=UserNameController.text.toString();
 RegisterMap["PHONE"]=UserPhoneController.text.toString();
 RegisterMap["SIGNUP_DATE"]=DateTime.now();

 HashMap<String,Object>UserDetailsMap=HashMap();

 UserDetailsMap["USER_NAME"]=UserNameController.text.toString();
 UserDetailsMap["PHONE"]="+91"+UserPhoneController.text;
 UserDetailsMap["TYPE"]="USER";
 if (fileprofileImage != null) {
  String photoId = DateTime.now().millisecondsSinceEpoch.toString();

  imgstrg = FirebaseStorage.instance.ref().child(photoId);
  await imgstrg.putFile(fileprofileImage!).whenComplete(() async {
   await imgstrg.getDownloadURL().then((value) {
    RegisterMap["PHOTO"] = value;
    // categorymap["id photo"] = photoId;
    //  editMap['IMAGE_URL'] = value;
    notifyListeners();
   });
   notifyListeners();
  });
  notifyListeners();
 }
 else {
  RegisterMap['PHOTO'] = profileImage;
  // editMap['IMAGE_URL'] = imageUrl;
 }
 if(from=="NEW"){
  RegisterMap["USER_ID"]=id;
  UserDetailsMap["USER_ID"]=id;
 }
 if(from=="NEW"){
  db.collection("CUSTOMER_DETAILS").doc(id).set(RegisterMap);
  db.collection("USERS").doc(id).set(UserDetailsMap);
 }else{
  db.collection("CUSTOMER_DETAILS").doc(userId).update(RegisterMap);
  db.collection("USERS").doc(userId).update(UserDetailsMap);
  notifyListeners();

 }
 GetCustomerfn(userId);
}
  // String userid="";
 void GetCustomerfn(String userId){
  print(userId+"fhf");
  db.collection("CUSTOMER_DETAILS").doc(userId).get().then((value) {

   if(value.exists){
    // userid= value.id;
    UserNameController.text=value.get("NAME").toString();
    // addressController.text=value.get("ADDRESS").toString();
    UserPhoneController.text=value.get("PHONE").toString();
     profileImage=value.get("PHOTO").toString();
    notifyListeners();
    print(userId+"xxxdxyz");
   // print(username+"huh");
   // print(useraddress+"huh");
   // print(userphone+"huh");
   }
   });
  }


void clearreg(){
 UserNameController.clear();
 //UserEmailController.clear();
 UserPhoneController.clear();
}

 Future<void> addToCart(String catid, String subcatid,BuildContext context,String itemId,
     String userId,String itemName,String itemPrice,String itemImage,) async {
  String CartItemid = DateTime
      .now()
      .microsecondsSinceEpoch
      .toString();
  HashMap<String, Object>addItemCart = HashMap();
  addItemCart["ITEM_NAME"] = itemName;
  addItemCart["PRICE"] = itemPrice;
  addItemCart["IMAGE"] = itemImage;
  addItemCart["ITEM_ID"] = itemId;
  addItemCart["ADDED_BY"] = "";
  addItemCart["CATEGORY_ID"] = catid;
  addItemCart["SUBCATEGORY_ID"] = subcatid;
  addItemCart["USER_ID"]=userId;
  addItemCart["CART_ID"] = CartItemid;

  addItemCart["TIME"] = DateTime.now();


  if (fileItemImage != null) {
   String photoId = DateTime
       .now()
       .microsecondsSinceEpoch
       .toString();
   imgstrg = FirebaseStorage.instance.ref().child(photoId);
   await imgstrg.putFile(fileItemImage!).whenComplete(() async {
    await imgstrg.getDownloadURL().then((value) {
     addItemCart["IMAGE"] = value;
     notifyListeners();
    });
   });
   notifyListeners();
  }

  db.collection("CARTITEMS")
      .where("USER_ID", isEqualTo: userId)
      .where("ITEM_ID", isEqualTo: itemId)
      .get().then((value) {
   if (value.docs.isEmpty) {
    db.collection("CARTITEMS").doc(CartItemid).set(addItemCart);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
     shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
     content: Center(child: Text(
      'Added To Cart', style: TextStyle(color: white, fontFamily: 'jml', fontSize: 20
     ))),
       backgroundColor: green2,));

   // getItems(catid,subcatid);
    getCartItems(userId);
    notifyListeners();
     }else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
     shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
     content: Center(child: Text(
      'Already Added', style: TextStyle(color: white, fontFamily: 'jml', fontSize: 20
       ))),
     backgroundColor: green2,));
    }
   });


  // finish(context);

 }
 List<int> cartTotal=[];
 int totalItemPrice=0;
 double dicount=0;
 int discount=0;
 int overAlltotal=0;

 List<String> cartItemsList = [];

 void getCartItems(String userId) {
print("sndjdjd");
  db.collection("CARTITEMS")
      .where("USER_ID", isEqualTo: userId)
      .get().then((value) {
   if (value.docs.isNotEmpty) {
    cartList.clear();
    cartTotal.clear();
    for (var value in value.docs) {
     cartList.add(
         CartModel(value.id, value.get("ITEM_NAME").toString(),
          value.get("PRICE").toString(),value.get("IMAGE").toString(),value.get("ITEM_ID").toString()));
     notifyListeners();
     cartTotal.add(int.parse(value.get("PRICE")));

     notifyListeners();
     cartItemsList.add(value.get("ITEM_ID").toString());
     notifyListeners();


    }
    totalItemPrice=cartTotal.reduce((a, b) => a + b);
    double discountRatio=totalItemPrice/5000;
    notifyListeners();

print(discountRatio.toString()+"nbvvvvg");

    if(discountRatio>=1){
     print("jnhhbbg");
     dicount=discountRatio * 300;
     discount=dicount.toInt();
     notifyListeners();
     print("${dicount}hhhhhhhhhhhhhhhh");
     notifyListeners();
    }
    overAlltotal=(totalItemPrice+4000)-discount;
    notifyListeners();

   }
   notifyListeners();
  });
 }

 void deletecartItem(BuildContext context,String userId,cid) {
  db.collection("CARTITEMS").doc(cid).delete();
  //notifyListeners();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
   shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
   content: Center(child: Text(
    'Deleted', style: TextStyle(color: white, fontFamily: 'jml', fontSize: 20
   ),
   ),
   ),
   backgroundColor: green2,));
  getCartItems(userId);
  notifyListeners();
 }
 DateTime fromDate=DateTime.now();
 DateTime returnDate=DateTime.now();
 DateTime toDate=DateTime.now().add(Duration(days: 15));
 bool firstDate=true;
 bool toDateFirstDate=true;

 void selectFromDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
   context: context,
   initialDate: DateTime.now(),
   firstDate: DateTime.now(),
   lastDate: DateTime(2025),
   builder: (BuildContext context, Widget? child) {
    return Theme(
     data: ThemeData.light().copyWith(
      primaryColor: green2, // Change the background color
      hintColor: Colors.white, // Change the text color
      colorScheme: ColorScheme.light(primary: green2),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
     ),
     child: child!,
    );
   },
  );
  if (pickedDate != null) {
   fromDate = pickedDate;
   print(fromDate);
   // toDate = fromDate.add(Duration(days: 15,hours: 24));

   firstDate = false;
   print(toDate.toString()+"aaaaaa");
   notifyListeners();
  }
 }
 void selectToDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
   context: context,
   initialDate: fromDate,
   firstDate: fromDate,
   lastDate: toDate,
   builder: (BuildContext context, Widget? child) {
    return Theme(
     data: ThemeData.light().copyWith(
      primaryColor: green2, // Change the background color
      hintColor: Colors.white, // Change the text color
      colorScheme: ColorScheme.light(primary: green2),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
     ),
     child: child!,
    );
   },
  );
  if (pickedDate != null && pickedDate != toDate) {
   // setState(() {
   returnDate = pickedDate;
   print(returnDate.toString()+"hvjhbjmm");
   toDateFirstDate=false;
   notifyListeners();
  }
 }
 void addPickupOrders(String userId,context, List itemId,String itemName,
     String itemPrice,String itemImage,String overAlltotal) {
  print(fromDate.toString()+"djnfhhfhf");
  print(returnDate.toString()+"vmvjj");
  String id = DateTime
      .now()
      .millisecondsSinceEpoch
      .toString();

  HashMap<String, Object> PickuporderMap = HashMap();
  // PickuporderMap["ITEM_NAME"] = itemName;
  // PickuporderMap["PRICE"] = double.parse(itemPrice);
  // PickuporderMap["IMAGE"] = itemImage;
  PickuporderMap["DEPOSITE"] = 4000;
  PickuporderMap["TOTAL_PRICE"] = double.parse(overAlltotal);
  DateTime k=fromDate;
  print(k.toString()+"dskjhhjdsh");
  PickuporderMap["BOOKING_DATE"] = k;
  PickuporderMap["RETURN_DATE"] = returnDate;
  print(fromDate.toString()+"nbbcbbc");
  PickuporderMap["TIME"] = DateTime.now();

  PickuporderMap["USER_ID"] = userId;
  PickuporderMap["ITEM_ID"] = itemId;
  PickuporderMap["ADDED_BY"] = "";
  PickuporderMap["PICKUPORDER_ID"] = id;

  db.collection("PICKUP ORDERS").doc(id).set(PickuporderMap);
 // getUserAppointments(userId);
  finish(context);
  notifyListeners();

 }

 void clearpaymentdetails(){
  overAlltotal =0;
  discount =0;
  totalItemPrice =0;
 }
 void deleteafterorder(BuildContext context,String userId,cid) {
  db.collection("CARTITEMS").doc(cid).delete();
  notifyListeners();
  overAlltotal =0;
  discount =0;
  totalItemPrice =0;
  notifyListeners();


  //getCartItems(userId);
 // notifyListeners();
 }


File? fileprofileImage;
 String profileImage="";
Future getProfileImagegallery() async {
 final imagePicker = ImagePicker();
 final pickedImage =
 await imagePicker.pickImage(source: ImageSource.gallery);
 print(pickedImage?.path.toString());
 if (pickedImage != null) {
  print("hjkl" + pickedImage.path);

  cropProfileImage(pickedImage.path,);
 } else {
  print('No image selected.');
 }
}

Future getProfileImagecamera() async {
 final imagePicker = ImagePicker();
 final pickedImage =
 await imagePicker.pickImage(source: ImageSource.camera);

 if (pickedImage != null) {
  // print("dfghjk"+pickedImage.path);
  cropProfileImage(pickedImage.path,);
 } else {
  print('No image selected.');
 }
}

Future<void> cropProfileImage(String path,) async {
 final croppedFile = await ImageCropper().cropImage(
  sourcePath: path,
  aspectRatioPresets: Platform.isAndroid
      ? [
   CropAspectRatioPreset.square,
   CropAspectRatioPreset.ratio3x2,
   CropAspectRatioPreset.original,
   CropAspectRatioPreset.ratio4x3,
   CropAspectRatioPreset.ratio16x9,
  ]
      : [
   CropAspectRatioPreset.original,
   CropAspectRatioPreset.square,
   CropAspectRatioPreset.ratio3x2,
   CropAspectRatioPreset.ratio4x3,
   CropAspectRatioPreset.ratio5x3,
   CropAspectRatioPreset.ratio5x4,
   CropAspectRatioPreset.ratio7x5,
   CropAspectRatioPreset.ratio16x9,
   CropAspectRatioPreset.ratio16x9
  ],
  uiSettings: [
   AndroidUiSettings(
       toolbarTitle: 'Cropper',
       toolbarColor: Colors.white,
       toolbarWidgetColor: Colors.black,
       initAspectRatio: CropAspectRatioPreset.original,
       lockAspectRatio: false),
   IOSUiSettings(
    title: 'Cropper',
   )
  ],
 );
 if (croppedFile != null) {
  fileprofileImage = File(croppedFile.path);
  // print(Registerfileimg.toString() + "fofiifi");
  notifyListeners();
 }
}

 TextEditingController AddressController = TextEditingController();
 TextEditingController DistrictController = TextEditingController();
 TextEditingController CityController = TextEditingController();
 TextEditingController EmailController = TextEditingController();
 TextEditingController CountryController = TextEditingController();
 TextEditingController PinController = TextEditingController();


 Future<void> addAddress(String userId) async {
  String id = DateTime
      .now()
      .microsecondsSinceEpoch
      .toString();
  HashMap<String, Object>addAddressMap = HashMap();
  addAddressMap["ADDRESS"] = AddressController.text.toString();
  addAddressMap["DISTRICT"] = DistrictController.text.toString();
  addAddressMap["CITY"] = CityController.text.toString();
  addAddressMap["PIN"] = PinController.text.toString();
  addAddressMap["EMAIL"] = EmailController.text.toString();
  addAddressMap["COUNTRY"] = CountryController.text.toString();
  addAddressMap["TIME"] = DateTime.now();
  addAddressMap["USER_ID"]=userId;
  notifyListeners();
  db.collection("USER ADDRESS").doc(id).set(addAddressMap);
  notifyListeners();
 }
}


// class StoreData {
//  final FirebaseFirestore db = FirebaseFirestore.instance;
//  final FirebaseStorage storage = FirebaseStorage.instance;
//
//  Future<String> uploadVideo(String videoUrl) async {
//   File videoFile = File(videoUrl);
//   String fileName = 'videos/${DateTime.now()}.mp4';
//
//   // Upload the video to Firebase Storage
//   await storage.ref().child(fileName).putFile(videoFile);
//
//   // Get the download URL for the uploaded video
//   String downloadURL = await storage.ref().child(fileName).getDownloadURL();
//
//   return downloadURL;
//  }
//
//  Future<void> saveVideoData(String videoDownloadUrl) async {
//   await db.collection("videos").add({
//    'url': videoDownloadUrl,
//    'timeStamp': FieldValue.serverTimestamp(),
//    'name': 'User Video'
//   });
//  }
// }
//


