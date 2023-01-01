

import 'package:forked/Controllers/OthersProfileController.dart';
import 'package:forked/Models/User.dart';
import 'package:forked/Models/forkedRecipe.dart';
import 'package:forked/Models/originalRecipie.dart';
import 'package:forked/Services/FireStoreRequests/allRequests.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Components/CardRecipeCard.dart';
import '../Components/userDisplay.dart';
import '../Models/following.dart';
import '../Services/FireStoreRequests/followingRequests.dart';
import '../Views/ViewRecipe.dart';
import '../Views/othersProfile.dart';
import '../Views/viewForkedRecippie.dart';
class searchController extends GetxController{


List<Widget> accountsWidgets=[];
List<Widget> recipies=[];

// @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();

//   }

searchFor({required String searchKey})async{
List<originalRecipe> originals= await SsearchingInOriginal(searchKey: searchKey);
List<forkedRecipe> forks= await SsearchingInForked(searchKey: searchKey);
List<user> accounts= await SsearchingInUsers(searchKey: searchKey);

 for (var i = 0; i < accounts.length; i++) {
      if (i < accounts.length) {
        accountsWidgets.add(Container(
          // height: Get.height * .27,
          // width: Get.width * .4,
          child: UserDisplay(
            folowers: accounts[i].followersNumber!,
            userName: accounts[i].username!,
            image: accounts[i].userProfileImage,
            funct: () async{
              List<following> userFollowingCount = await readUsersFollowing(userID: accounts[i].userID.toString());
     List<following> userFollowersCount =
            await readUsersFollowers(userID: accounts[i].userID.toString());
              Get.to(othersProfile(
                listOfFollowersCount:userFollowersCount ,
                listOfFollowingCount: userFollowingCount,
                otherUser: accounts[i], 
              ))!.then((value) => Get.delete<OthersProfileController>());
            },
          ),
        ));
      }
    }

//;olk







    for (var i = 0; i < 10; i++) {
      if (i % 2 == 0 && i < originals.length) {
        recipies.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: SmallCardRecipeCard(
              recipeName: originals[i].title!,
              recipeImage: originals[i].imgPath,
              userName: originals[i].username,
                            userAvatar: originals[i].userProfileImage,

              ImageFunct: () {                Get.to(ViewRecipe(myRecipie: originals[i]));
},
              likeFunct: () {},
              accontFunct: () {},
            ),
          ),
        ));
      }

      if (i % 2 == 1 && i < forks.length) {

        recipies.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                //   minWidth: Get.width*.5,
                // minHeight: Get.height*.45,
                //   maxHeight: Get.height*.46,
                //  maxWidth: Get.width*.51,
                ),
            child: SmallCardRecipeCard(
              recipeName: forks[i].title!,
              recipeImage: forks[i].imgPath!,
              userName: forks[i].username,
                            userAvatar: forks[i].userProfileImage,

              ImageFunct: () {    Get.to(viewMyForkedRecipie(myRecipie: forks[i],));},
              likeFunct: () {},
              accontFunct: () {},
            ),
          ),
        ));
      }
    }
    ;

update();
}

}