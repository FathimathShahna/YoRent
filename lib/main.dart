import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yorent/ADMIN/add_subCategory.dart';
import 'package:yorent/ADMIN/items.dart';
import 'package:yorent/ADMIN/admin_home.dart';
import 'package:yorent/PROVIDER/loginprovider.dart';
import 'package:yorent/PROVIDER/mainProvider.dart';
import 'package:yorent/USER/OTP.dart';
import 'package:yorent/USER/login.dart';
import 'package:yorent/USER/splash.dart';

import 'USER/getstrt.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MainProvider(),),
      ChangeNotifierProvider(create: (context) => LoginProvider(),)
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: Splash(),
      ),
    );
  }
}

