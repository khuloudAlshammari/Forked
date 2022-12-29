import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/followcomp.dart';
import 'package:forked/Components/picker.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/ProfileController.dart';
import 'package:forked/Models/User.dart';
import 'package:forked/Models/following.dart';
import 'package:forked/Services/FireStoreRequests/UserRequests.dart';
import 'package:forked/Services/FireStoreRequests/followingRequests.dart';
import 'package:forked/main.dart';
import 'package:get/get.dart';

import '../Components/AppBar.dart';
import '../Components/FollowAndUnfollow.dart';
import '../Controllers/OthersProfileController.dart';

class othersProfile extends StatelessWidget {
  user otherUser;

  OthersProfileController OthersProfileCon = Get.put(OthersProfileController());

  List<following> listOfFollowingCount = [];
  List<following> listOfFollowersCount = [];

  othersProfile(
      {super.key,
      required this.otherUser,
      required this.listOfFollowersCount,
      required this.listOfFollowingCount}) {
    OthersProfileCon.isFollow =
        OthersProfileCon.checkIfIsFollow(userID: otherUser.userID);

    OthersProfileCon.usersRec(userID: otherUser.userID);
    OthersProfileCon.update();

    OthersProfileCon.usersSav(userID: otherUser.userID);
    OthersProfileCon.update();

    OthersProfileCon.userIno(userID: otherUser.userID);
    OthersProfileCon.update();


    if (otherUser.followersNumber != listOfFollowersCount.length) {
      updateData(
          collection: 'users',
          docoment: "${otherUser.userID.toString()}",
          fieldKey: "followersNumber",
          newValue: listOfFollowersCount.length.toInt());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
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
                    otherUser.username.toString(),
                    style: h2,
                  ),
                ),
              ),

              //follow button :
              GetBuilder<OthersProfileController>(builder: (builder) {
                return FollowAndUnfollow(
                  isFollow: OthersProfileCon.isFollow,
                  onPressFollow: () {
                    createFollowing(
                        followedUserID: otherUser.userID.toString(),
                        userID: myUserData.userID.toString());
                    OthersProfileCon.isFollow = true;
                    OthersProfileCon.update();
                  },
                  onPressUnFollow: () {
                    deleteFollowing(
                        followingID:
                            "${myUserData.userID.toString()}_${otherUser.userID.toString()}");
                    OthersProfileCon.isFollow = false;
                    OthersProfileCon.update();
                  },
                );
              }),

              SizedBox(
                height: 5,
              ),
              //followers and folowing :
              SizedBox(
                width: Get.width * .6,
                height: 80,
                child: FollowComp(
                  followercount: listOfFollowersCount.length, //
                  followingcount: listOfFollowingCount.length, //
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: Get.height * .12,
                width: Get.width * .85,
                //color: Colors.tealAccent,

                child: Text(                  
                  "${otherUser.profile == null ? "" : otherUser.profile.toString()}" ,
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
                  pickerIndex: OthersProfileCon.currentIndex!,
                  f1: () {
                    OthersProfileCon.setIndex(index: 0);
                  },
                  f2: () {
                    OthersProfileCon.setIndex(index: 1);
                  },
                  f3: () {
                    OthersProfileCon.setIndex(index: 2);
                  },
                );
              }),

              //context:
              Expanded(
                flex: 1,
                child: Container(
                  width: Get.width,
                  child:
                      GetBuilder<OthersProfileController>(builder: (builder) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //List of user recipes :
                        OthersProfileCon.currentIndex == 0
                            ? Expanded(
                                flex: 1,
                                child: Container(
                                  width: Get.width * 3,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .02),
                                  child: GridView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: OthersProfileCon
                                          .otherUserRecipes!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        return OthersProfileCon
                                            .otherUserRecipes![index];
                                      }),
                                ),
                              )
                            : SizedBox(),

                        //List of saved recipes ://here
                        OthersProfileCon.currentIndex == 1
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
                                      itemCount: OthersProfileCon.otherUserSaved!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        return OthersProfileCon
                                            .otherUserSaved![index];
                                      }),
                                ),
                              )
                            : SizedBox(),

                        //List of user innovation :
                        OthersProfileCon.currentIndex == 2
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
                                      itemCount: OthersProfileCon.otheruserInnovations!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        return OthersProfileCon
                                            .otheruserInnovations![index];
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
