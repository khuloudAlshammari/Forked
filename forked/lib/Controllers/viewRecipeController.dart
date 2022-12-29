
import 'package:flutter/material.dart';
import 'package:forked/Components/Camera.dart';
import 'package:forked/Constants/styles.dart';
import 'package:get/get.dart';

import '../Components/CardRecipeCard.dart';
import '../Components/preparations_details.dart';

class viewRecipeController extends GetxController{

  int? currentIndex=0;
  List<Widget>? steps=[];
  List<Widget>? ingredients=[];
  List<Widget>? forks;





setIndex({required int index}){
currentIndex=index;
update();
}

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

   


forks=[
  Column(
    children: [
      Row(
        children: [
          myCamera(),
          Container(
      height: Get.height * .3,
      width: Get.width * .4,
      child: SmallCardRecipeCard(
        recipeName: "pancake",
        recipeImage: "images/6.jpg",
        ImageFunct: () {},
      ),
    )
        ],
      ),

      Row(
        children: [
          Container(
      height: Get.height * .3,
      width: Get.width * .4,
      child: SmallCardRecipeCard(
        recipeName: "pancake",
        recipeImage: "images/6.jpg",
        ImageFunct: () {},
      ),
    ),
    Container(
      height: Get.height * .3,
      width: Get.width * .4,
      child: SmallCardRecipeCard(
        recipeName: "pancake",
        recipeImage: "images/6.jpg",
        ImageFunct: () {},
      ),
    )
        ],
      )
    ],
  )
];

  }


}