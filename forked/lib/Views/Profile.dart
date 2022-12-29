import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/FollowAndUnfollow.dart';
import 'package:forked/Components/followcomp.dart';
import 'package:forked/Components/picker.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/ProfileController.dart';
import 'package:forked/main.dart';
import 'package:get/get.dart';

import '../Components/AppBar.dart';

class Profile extends StatelessWidget {
  Profile({
    super.key,
  });
  ProfileController profileController = Get.put(ProfileController());

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
                    //+++++======+++++
                    myUserData.username.toString(),
                    style: h2,
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              //followers and folowing :
              SizedBox(
                width: Get.width * .6,
                height: 80,
                child: FollowComp(
                  followercount: userFollowers.length,
                  followingcount: userFollowing.length,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: Get.height * .12,
                width: Get.width * .85,
                child: Text(
                  "${myUserData.profile == null ? "" : myUserData.profile.toString()}",
                  style: h3,
                ),
              ),
              SizedBox(
                height: 18,
              ),

              //picker :
              GetBuilder<ProfileController>(builder: (builder) {
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
                  width: Get.width,
                  child: GetBuilder<ProfileController>(builder: (builder) {
                    return
                        //List of user recipes :
                        Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        profileController.currentIndex == 0
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  width: Get.width * 3,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .02),
                                  child: GridView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          profileController.userRecipes!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        return profileController
                                            .userRecipes![index];
                                      }),
                                ),
                              )
                            : SizedBox(),

                        //List of saved recipes :
                        profileController.currentIndex == 1
                            ? 
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: Get.width * 3,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .02),
                                  child: GridView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          profileController.userSaved!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        return profileController
                                            .userSaved![index];
                                      }),
                                ),
                              )
                            : SizedBox(),

                        //List of user innovation :
                        profileController.currentIndex == 2
                            ?
                             Expanded(
                                flex: 1,
                                child: Container(
                                  width: Get.width * 3,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .02),
                                  child: GridView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          profileController.userInnovations!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        return profileController.userInnovations![index];
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
        )
      ]),
    );
  }
}
