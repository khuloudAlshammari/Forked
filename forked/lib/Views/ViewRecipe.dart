import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/Recipeinfo.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/viewRecipeController.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../Components/picker.dart';
import '../Components/preparations_details.dart';

class ViewRecipe extends StatelessWidget {
  ViewRecipe({super.key});
  viewRecipeController myController = Get.put(viewRecipeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            height: Get.height * 1.3,
            width: Get.width,
            child: Stack(
              children: [
                //Image :
                // Image.network("https://freesvg.org/img/abstract-user-flat-4.png")
                //Back Image :
                Container(
                  width: Get.width,
                  height: Get.height * .4,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset("images/0.jpg"),
                  ),
                ),

                //Main Container :
                Positioned(
                  top: Get.height * .33,
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),

                        //Top row :For name of recipe and likes
                        Container(
                          width: Get.width * .9,
                          //color: Colors.amber,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 25,
                                  //color: Colors.blueGrey,
                                  child: Text(
                                    "Pancake ",
                                    style: h2,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //color: Colors.tealAccent,
                                  child: LikeButton(likeCount: 100 //****
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),

                        //cook name :
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          height: 25,
                          width: Get.width * .9,
                          //color: Colors.pink,
                          child: Text("Derived from pancake"),
                        ),

                        //Derived :
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 25,
                          width: Get.width * .9,
                          //color: Colors.pink,
                          child: Text("Chef B"),
                        ),

                        //info:
                        SizedBox(
                            height: 100,
                            width: 200,
                            child: RecipeInfo(
                              cal: "200",
                              serving: "5",
                              time: "50",
                            )),

                        //test:
                        SizedBox(
                          height: 18,
                        ),
                        GetBuilder<viewRecipeController>(builder: (d) {
                          return picker(
                            first: "Ingredients",
                            second: "Preperation",
                            third: "Chef innovation",
                            pickerIndex: myController.currentIndex!,
                            f1: () {
                              myController.setIndex(index: 0);
                            },
                            f2: () {
                              myController.setIndex(index: 1);
                            },
                            f3: () {
                              myController.setIndex(index: 2);
                            },
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Color.fromARGB(255, 255, 198, 198),
                            child:
                                GetBuilder<viewRecipeController>(builder: (f) {
                              return ListView(
                                children: [
                                  //test to display steps
                                  myController.currentIndex == 1
                                      ? Padding(
                                          padding: EdgeInsets.all(0),
                                          child: Column(
                                            children: myController.steps!,
                                          ),
                                        )
                                      : SizedBox(),

                                  //test to display steps

                                  myController.currentIndex == 0
                                      ? Padding(
                                          padding: EdgeInsets.all(0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: myController.ingredients!,
                                          ),
                                        )
                                      : SizedBox(),

                                  //test to display steps
                                  myController.currentIndex == 2
                                      ? Padding(
                                          padding: EdgeInsets.all(0),
                                          child: Column(
                                            children: myController.forks!,
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
