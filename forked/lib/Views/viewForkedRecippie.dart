import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/Recipeinfo.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/viewRecipeController.dart';
import 'package:forked/Models/forkedRecipe.dart';
import 'package:forked/Models/originalRecipie.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../Components/picker.dart';
import '../Components/preparations_details.dart';

class viewMyForkedRecipie extends StatelessWidget {
  forkedRecipe myRecipie;
  viewRecipeController myController = Get.put(viewRecipeController());

  viewMyForkedRecipie({super.key, required this.myRecipie}) {
    myController.forks = [];
    myController.id = myRecipie.userID;

    myController.cal = myRecipie.calories;
    myController.min = myRecipie.minutes;
    myController.title = myRecipie.title;
    myController.serv = myRecipie.servings;

    myController.parentID = myRecipie.recipeID!;
    myController.ooCon();
    // StepsDescription(step: 1, stepdetail: "stepdq;qwldq;wdkq;wokdpqowdkqpowdkq;dkq;odkq;wodkq;owdkq;wodkq;wodkq;dwokq;odwkq;wodkq;odkq;owkdq;odk;qowdkq;owdk;dokq;okd;qokdwq;dwlq;dkq;owdkqowdkpqowdkqpowdkpqowdkpqowdkqpowdkqpokdwqpdokqplqdnqlwndqilwdnkqwdnjkqjndkqjndkqjwndqkjwndkqjwndkqjndqkjwndkqwjndqkjwdnqkjwndkqjdnwkqjndkqjwdnowdkqpodkqpwodkqpowdkqpokdq;qowdk;qodkq;wdkq;wodketail"),
    myController.steps = [];
    myController.ingredients = [];
     String mySteps;
    if( myRecipie.preperation!.length>3){ mySteps =
        myRecipie.preperation!.substring(0, myRecipie.preperation!.length - 3);
    myController.stepsList = mySteps.split("=_=");}
    
    for (var i = 0; i < myController.stepsList.length; i++) {
      myController.steps!.add(Padding(
          padding: EdgeInsets.only(left: 20),
          child: StepsDescription(
              step: i + 1, stepdetail: myController.stepsList[i])));
    }

    String myIngredients;
    if (myRecipie.ingredients!.length > 3) {
      myIngredients = myRecipie.ingredients!
          .substring(0, myRecipie.ingredients!.length - 3);
    } else {
      myIngredients = myRecipie.ingredients!;
    }
    myController.ingredientList = myIngredients.split("=_=");
    for (var i = 0; i < myController.ingredientList.length; i++) {
      myController.ingredients!.add(
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                "• ",
                style: stepLarge,
              ),
              Text(
                "${myController.ingredientList[i]}",
                style: stepss,
              ),
            ],
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        myController.forks = [];
        myController.forks = await myController.getRecipieForks(
            forksOfRecipie: myController.forks,
            parentID: myController.parentID);

        myController.update();
        return true;
      },
      child: Scaffold(
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
                      child: myRecipie.imgPath == "imageTesting"
                          ? SizedBox()
                          : Image.network("${myRecipie.imgPath}"),
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
                                      myRecipie.title.toString(),
                                      style: h2,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    //color: Colors.tealAccent,
                                    child: LikeButton(
                                        likeCount: myRecipie.likes //****
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          //cook name :

                          //Derived :
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            height: 25,
                            width: Get.width * .9,
                            //color: Colors.pink,
                            child: InkWell(
                                child: Text(
                              "Derived from ${myRecipie.parentName}",
                              style: h4TransParent,
                            )),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 25,
                            width: Get.width * .9,
                            //color: Colors.pink,
                            child: Text(
                              "By ${myRecipie.username.toString()}",
                              style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: Color.fromARGB(255, 0, 70, 81),
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),

                          //info:
                          SizedBox(
                              height: 100,
                              width: 200,
                              child: RecipeInfo(
                                cal: myRecipie.calories.toString(),
                                serving: myRecipie.servings.toString(),
                                time: myRecipie.minutes.toString(),
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

                          // Expanded(
                          //   flex: 1,
                          //   child: Container(
                          //     color: Color.fromARGB(255, 255, 198, 198),
                          //     child:
                          //         GetBuilder<viewRecipeController>(builder: (f) {
                          //       return ListView(
                          //         children: [
                          //           //test to display steps
                          //           myController.currentIndex == 1
                          //               ? Padding(
                          //                   padding: EdgeInsets.all(0),
                          //                   child: Column(
                          //                     children: myController.steps!,
                          //                   ),
                          //                 )
                          //               : SizedBox(),

                          //           //test to display steps

                          //           myController.currentIndex == 0
                          //               ? Padding(
                          //                   padding: EdgeInsets.all(0),
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.stretch,
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.start,
                          //                     children: myController.ingredients!,
                          //                   ),
                          //                 )
                          //               : SizedBox(),

                          //           //test to display steps
                          //           myController.currentIndex == 2
                          //               ? Padding(
                          //                   padding: EdgeInsets.all(0),
                          //                   child: Column(
                          //                     children: myController.forks!,
                          //                   ),
                          //                 )
                          //               : SizedBox(),
                          //         ],
                          //       );
                          //     }),
                          //   ),
                          // )

                          Expanded(
                            flex: 1,
                            child: Container(
                              width: Get.width,
                              child: GetBuilder<viewRecipeController>(
                                  builder: (builder) {
                                return
                                    //List of user recipes :
                                    Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    myController.currentIndex == 0
                                        ? Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: Get.width * 3,
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .02),
                                              child: GridView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: myController
                                                      .ingredients!.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    childAspectRatio:
                                                        Get.width /
                                                            (Get.width * .2),
                                                    crossAxisCount: 1,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return myController
                                                        .ingredients![index];
                                                  }),
                                            ),
                                          )
                                        : SizedBox(),

                                    //List of saved recipes :
                                    myController.currentIndex == 1
                                        ? Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: Get.width * 3,
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .02),
                                              child: GridView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: myController
                                                      .steps!.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 1,
                                                    childAspectRatio:
                                                        Get.width /
                                                            (Get.width * .6),
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return myController
                                                        .steps![index];
                                                  }),
                                            ),
                                          )
                                        : SizedBox(),

                                    //List of user innovation :
                                    myController.currentIndex == 2
                                        ? Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: Get.width * 3,
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .02),
                                              child: GridView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: myController
                                                      .forks!.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return myController
                                                        .forks![index];
                                                  }),
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
      ),
    );
  }
}
