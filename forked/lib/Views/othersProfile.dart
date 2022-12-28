import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/followcomp.dart';
import 'package:forked/Components/picker.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/ProfileController.dart';
import 'package:get/get.dart';

import '../Components/AppBar.dart';
import '../Components/FollowAndUnfollow.dart';
import '../Controllers/OthersProfileController.dart';

class othersProfile extends StatelessWidget {
  othersProfile({
    super.key,
  });
  OthersProfileController profileController = Get.put(OthersProfileController());

  @override
  Widget build(BuildContext context) {
    print(profileController.userRecipes);
    return Scaffold(
      appBar: myappBar,
      body: ListView(children: [
        Container(
          height: Get.height * 1.3,
          width: Get.width,
          color: Colors.white,

          //Colum :
          child: Column(
            children: [
              //avatar :
              FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: FittedBox(
                      child: Image.network(
                          "https://freesvg.org/img/abstract-user-flat-4.png"),
                      fit: BoxFit.fill,
                    ),
                  )),

              //user name :
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 30,
                //color: Colors.teal,
                child: Center(
                  child: Text(
                    "Cloris",
                    style: h2,
                  ),
                ),
              ),

              //follow button :
              FollowAndUnfollow(),
              
              SizedBox(
                height: 5,
              ),
              //followers and folowing :
              SizedBox(
                width: Get.width * .6,
                height: 80,
                child: FollowComp(
                  followercount: 299,
                  followingcount: 534,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: Get.height * .12,
                width: Get.width * .85,
                color: Colors.tealAccent,
                child: Text(
                  "I am a stay-at-home mom (sounds better than recently retired , don’t you think?) who loves to spend time in my kitchen",
                  style: h3,
                ),
              ),
              SizedBox(
                height: 18,
              ),

              //picker :
              GetBuilder<OthersProfileController>(builder: (builder) {
                return picker(
                  first: "Recipes",
                  second: "Saved",
                  third: "Chef Innovation",
                  pickerIndex: profileController.currentIndex!,
                  f1: () {
                    profileController.setIndex(index: 0);
                  },
                  f2: () {
                    profileController.setIndex(index: 1);
                  },
                  f3: () {
                    profileController.setIndex(index: 2);
                  },
                );
              }),

              //context:
              Expanded(
                flex: 1,
                child: Container(
                  child: GetBuilder<OthersProfileController>(builder: (builder) {
                    return ListView(
                      children: [
                        //List of user recipes :
                        profileController.currentIndex == 0
                            ? Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: profileController.userRecipes!,
                                ),
                              )
                            : SizedBox(),

                        //List of saved recipes :
                        profileController.currentIndex == 1
                            ? Padding(
                                padding: EdgeInsets.all(0),
                                child: Column(
                                  children: profileController.userSaved,
                                ),
                              )
                            : SizedBox(),

                        //List of user innovation :
                        profileController.currentIndex == 2
                            ? Padding(
                                padding: EdgeInsets.all(0),
                                child: Column(
                                  children: profileController.userInnovations,
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
        )
      ]),
    );
  }
}
