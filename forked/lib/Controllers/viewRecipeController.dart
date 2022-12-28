
import 'package:flutter/material.dart';
import 'package:forked/Components/Camera.dart';
import 'package:forked/Constants/styles.dart';
import 'package:get/get.dart';

import '../Components/CardRecipeCard.dart';
import '../Components/preparations_details.dart';

class viewRecipeController extends GetxController{

  int? currentIndex=0;
  List<Widget>? steps;
  List<Widget>? ingredients;
  List<Widget>? forks;





setIndex({required int index}){
currentIndex=index;
update();
}

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    steps=[  StepsDescription(step: 1, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),
                            StepsDescription(step: 2, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),  StepsDescription(step: 1, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),
                            StepsDescription(step: 2, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),  StepsDescription(step: 1, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),
                            StepsDescription(step: 2, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),  StepsDescription(step: 1, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),
                            StepsDescription(step: 2, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),  StepsDescription(step: 1, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),
                            StepsDescription(step: 2, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),  StepsDescription(step: 1, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),
                            StepsDescription(step: 2, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),];
 
 ingredients=[
   Padding(
     padding: const EdgeInsets.symmetric(vertical: 15),
     child: Text("• ingredient", style: h4,),
   ),
 Padding(
     padding: const EdgeInsets.symmetric(vertical: 15),
     child: Text("• ingredient", style: h4,),
   ),    Padding(
     padding: const EdgeInsets.symmetric(vertical: 15),
     child: Text("• ingredient", style: h4,),
   ),
 Padding(
     padding: const EdgeInsets.symmetric(vertical: 15),
     child: Text("• ingredient", style: h2,),
   ),    Padding(
     padding: const EdgeInsets.symmetric(vertical: 15),
     child: Text("• ingredient", style: h4,),
   ),
 Padding(
     padding: const EdgeInsets.symmetric(vertical: 15),
     child: Text("• ingredient", style: h4,),
   ),
 ];



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