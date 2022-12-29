import 'package:flutter/material.dart';
import 'package:forked/Components/Camera.dart';
import 'package:forked/Components/RecipeImage.dart';
import 'package:forked/Components/userDisplay.dart';
import 'package:get/get.dart';

class testing extends StatelessWidget {
  testing({super.key});

// TextEditingController con=TextEditingController();

// List<Widget> listWidget=[];

// List<TextEditingController> lis=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: RecipeImage(imagePath:"https://insanelygoodrecipes.com/wp-content/uploads/2021/05/Ground-Chicken-Meatballs-683x1024.png",)
        //child:
        // InkWell(
        // onTap: () {
        //   Get.snackbar("title", "message");
        // },
        // child: Container(
        //   child: Expanded(
        //     flex: 6,
        //     child: FractionallySizedBox(
        //       widthFactor: 1,
        //       child: Container(
        //         // height: heightVar -10,
        //         //width: WidthVar,
        //         // color: Colors.amber,
        //         child: FittedBox(
        //           child: Material(
        //             child: Image.network(
        //                 "https://freesvg.org/img/abstract-user-flat-4.png"),
        //           ),
        //           fit: BoxFit.fill,
        //         ),
        //       ),
        //     ),
        //   ),
        // ))
      ),
    );
  }
}
