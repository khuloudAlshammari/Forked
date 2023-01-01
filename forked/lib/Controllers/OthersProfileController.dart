import 'package:flutter/material.dart';
import 'package:forked/Components/CardRecipeCard.dart';
import 'package:forked/Components/RecipeImage.dart';
import 'package:forked/Models/forkedRecipe.dart';
import 'package:forked/Models/originalRecipie.dart';
import 'package:forked/Models/savedRecipe.dart';
import 'package:forked/Services/FireStoreRequests/RiecipeRequests.dart';
import 'package:forked/Services/FireStoreRequests/forkedRecipeRequests.dart';
import 'package:forked/Services/FireStoreRequests/savedRecipeRequests.dart';
import 'package:forked/Views/ViewRecipe.dart';
import 'package:forked/Views/othersProfile.dart';
import 'package:forked/Views/viewForkedRecippie.dart';
import 'package:forked/main.dart';
import 'package:get/get.dart';

class OthersProfileController extends GetxController {
  List<Widget>? otherUserRecipes = [];
  List<Widget>? otheruserInnovations = [];
  List<Widget>? otherUserSaved = [];
  int? currentIndex = 0;
  bool? isFollow;

  setIndex({required int index}) {
    currentIndex = index;
    update();
  }

  checkIfIsFollow({String? userID}) {
    List<String> usersIDs = [];
    for (var element in userFollowing) {
      usersIDs.add(
          "${element.userID.toString()}_${element.followedUserID.toString()}");
      print(element.userID.toString());
    }
    print("${myUserData.userID}_${userID}");
    print(usersIDs.contains("${myUserData.userID}_${userID}"));
    update();
    return usersIDs.contains("${myUserData.userID}_${userID}");
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  //userRecipes list :
  Future<List<Widget>?> addInUserRecipes(
      {List<Widget>? UserRecipes, String? userId}) async {
    List<originalRecipe> userOriginalRecipies =
        await readUsersOriginalRecipies(userID: userId);

    for (var i = 0; i < userOriginalRecipies.length; i++) {
      UserRecipes?.add(
        ConstrainedBox(
            constraints: BoxConstraints(),
            child: RecipeImage(
              imagePath:
                 userOriginalRecipies[i].imgPath,
              on_Tap: () {
                Get.to(ViewRecipe(
                  myRecipie: userOriginalRecipies[i],
                ));
              },
            )),
      );
    }
    ;
    return UserRecipes;
  }

  usersRec({String? userID}) async {
    otherUserRecipes =
        await addInUserRecipes(UserRecipes: otherUserRecipes, userId: userID);
    update();
  }

  //userSaved List
  Future<List<Widget>?> UserSavedRecipies(
      {List<Widget>? UserSavedRecipes, String? userId}) async {
    List<savedRecipe> savedRecipies =
        await readUserSavedRecipies(userID: userId);

    for (var i = 0; i < savedRecipies.length; i++) {
      UserSavedRecipes?.add(
        ConstrainedBox(
            constraints: BoxConstraints(),
            child: RecipeImage(
              imagePath:
                  "https://insanelygoodrecipes.com/wp-content/uploads/2021/05/Ground-Chicken-Meatballs-683x1024.png",
              on_Tap: () {},
            )),
      );
    }
    ;
    return UserSavedRecipes;
  }

  usersSav({String? userID}) async {
    otheruserInnovations = await UserSavedRecipies(
        UserSavedRecipes: otheruserInnovations, userId: userID);
  }

  //userInnovations List
  Future<List<Widget>?> addUserInnovations(
      {List<Widget>? userInnovations, String? userId}) async {
    List<forkedRecipe> innovationsRecipies =
        await readUsersForkedlRecipies(userID: userId);

    for (var i = 0; i < innovationsRecipies.length; i++) {
      userInnovations?.add(
        ConstrainedBox(
            constraints: BoxConstraints(),
            child: RecipeImage(
              imagePath:
                innovationsRecipies[i].imgPath,
              on_Tap: () {
                Get.to(viewMyForkedRecipie(
                  myRecipie: innovationsRecipies[i],
                ));
              },
            )),
      );
    }
    ;
    return userInnovations;
  }

  userIno({String? userID}) async {
    otherUserSaved = await addUserInnovations(
        userInnovations: otherUserSaved, userId: userID);
  }
}
