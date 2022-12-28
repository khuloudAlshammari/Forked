import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CardRecipeCard.dart';
import 'package:get/get.dart';

class Following extends StatelessWidget {
  const Following({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          height: Get.height * .5,
          width: Get.width,
          child: SmallCardRecipeCard(
            recipeName: "pancake",
            userName: "muhammed alaqeel",
            ImageFunct: () {},
           
          ),
        )
      ]),
    );
  }
}
