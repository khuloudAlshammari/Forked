import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/FollowAndUnfollow.dart';
import 'package:forked/Components/followcomp.dart';
import 'package:forked/Components/picker.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/ProfileController.dart';
import 'package:forked/Views/viewFollowing.dart';
import 'package:forked/main.dart';
import 'package:get/get.dart';
import '../Components/AppBar.dart';
import '../Components/FloatingActionButton.dart';

class Profile extends StatelessWidget {
  Profile({
    super.key,
  });
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    print(profileController.userRecipes);
    return Scaffold(
      floatingActionButton: MyWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: SafeArea(
        child: ListView(children: [
          Container(
            height: Get.height * 1.3,
            width: Get.width,
            color: Colors.white,

            //Colum :
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                //avatar :
                Center(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage(myUserData.userProfileImage!),
                      fit: BoxFit.fill)),
            ),
          ),

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
                    func1: () {
                      Get.to(viewFollowers(followers: userFollowing,i: 1,));
                    },
                    func2: () {
                 Get.to(viewFollowers(followers: userFollowers));

                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //profile :
                Container(
                  height: Get.height * .12,
                  width: Get.width * .85,
                  child: Text(
                    //Get.arguments.toString()
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
                                        top:
                                            MediaQuery.of(context).size.height *
                                                .02),
                                    child: GridView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: profileController
                                            .userRecipes!.length,
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
                              ? Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: Get.width * 3,
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
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
                              ? Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: Get.width * 3,
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                .02),
                                    child: GridView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: profileController
                                            .userInnovations!.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                        ),
                                        itemBuilder: (context, index) {
                                          return profileController
                                              .userInnovations![index];
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
      ),
    );
  }
}
