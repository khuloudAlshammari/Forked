import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RecipeImage extends StatelessWidget {
  RecipeImage({super.key, this.imagePath ,this.on_Tap});
  Function()? on_Tap;
  final imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: on_Tap,
        child: Container(
          height: Get.height * .30,
          width: Get.width * .5,
          child: FittedBox(
            child: Image.network(imagePath),
            fit: BoxFit.fill,
          ),
        ));
  }
}
