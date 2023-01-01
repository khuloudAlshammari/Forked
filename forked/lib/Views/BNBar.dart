import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Views/CreateRecipe.dart';
import 'package:forked/Views/Home.dart';
import 'package:forked/Views/Profile.dart';
import 'package:get/get.dart';

import '../Controllers/ProfileController.dart';
import '../Controllers/createRecipeController.dart';

class BNBart extends StatefulWidget {
  const BNBart({super.key});

  @override
  State<BNBart> createState() => _BNBartState();
}

class _BNBartState extends State<BNBart> {
  int click = 0;
  List Pages = [
    Home(),
    createRecipe(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[click],
      bottomNavigationBar: BottomNavigationBar(
        
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          //elevation: 0,
          currentIndex: click,
          selectedItemColor: lightGreen,
          unselectedItemColor: grey,
          onTap: ((value) {
            setState(() {
              // if(click==0 || click==2){
              Get.delete<createRecipeController>();
              Pages[1]=createRecipe();
                if(value==2){
                  Get.delete<ProfileController>();

                              Pages[2]=Profile();
              }
              click = value;

            });
          }),
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home_rounded,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.add_circle_outline_outlined,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ]),
    );
  }
}
