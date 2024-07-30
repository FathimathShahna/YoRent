import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yorent/USER/cart.dart';
import 'package:yorent/USER/home.dart';
import 'package:yorent/USER/profile.dart';

import '../CONSTANT/mycolor.dart';

class Bottombar extends StatefulWidget {
  String userId,Name,Phone;

  Bottombar({super.key, required this.userId,required this.Name,required this.Phone});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex = 0;



  @override
  void _itemTapped(int index){
    setState(() {
      selectedIndex = index;
      print(selectedIndex.toString()+"ppkk");
    });

  }


  @override
  Widget build(BuildContext context) {
    print("ytdfyghg"+widget.Name);
    var pages = [
     home(userId: widget.userId),
      cart(userId: widget.userId,),
      profile(userId: widget.userId,Name:widget.Name,Phone: widget.Phone,)

    ];

    return Scaffold(
      body: pages[selectedIndex],

      extendBody: true,
      bottomNavigationBar:  DotNavigationBar(
        margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
        // enableFloatingNavBar: true,
        selectedItemColor: green2,
        unselectedItemColor: white,
        backgroundColor: green2.withOpacity(0.7),
        currentIndex: selectedIndex,

        onTap: _itemTapped,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon:
            Badge(
              backgroundColor: Colors.transparent,// Customize badge color
              child: Stack(
                children: <Widget>[
                  Icon(Icons.shopping_cart_rounded),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: green2,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //icon: Icon(Icons.shopping_cart_rounded),

          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),

          ),
        ],

      ),
    );
  }
}