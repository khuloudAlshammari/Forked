import 'package:flutter/cupertino.dart';
import 'package:forked/Components/CardRecipeCard.dart';
import 'package:forked/Models/savedRecipe.dart';
import 'package:forked/Services/FireStoreRequests/savedRecipeRequests.dart';
import 'package:forked/Views/viewForkedRecippie.dart';
import 'package:get/get.dart';

import '../Components/RecipeImage.dart';
import '../Models/forkedRecipe.dart';
import '../Models/originalRecipie.dart';
import '../Services/FireStoreRequests/RiecipeRequests.dart';
import '../Services/FireStoreRequests/forkedRecipeRequests.dart';
import '../Views/ViewRecipe.dart';
import '../main.dart';

class ProfileController extends GetxController {
  List<Widget>? userRecipes = [];
  List<Widget>? userInnovations = [];
  List<Widget>? userSaved = [];
  int? currentIndex = 0;

  setIndex({required int index}) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    userRecipes = await addInUserRecipes(
        UserRecipes: userRecipes, userId: myUserData.userID);
    userSaved = await UserSavedRecipies(
        UserSavedRecipes: userSaved, userId: myUserData.userID);
    userInnovations = await addUserInnovations(
        userInnovations: userInnovations, userId: myUserData.userID);
    update();
  }

  //userRecipes list :
  Future<List<Widget>?> addInUserRecipes({List<Widget>? UserRecipes, String? userId}) async {
    List<originalRecipe> userOriginalRecipies = await readUsersOriginalRecipies(userID: userId);

    for (var i = 0; i < userOriginalRecipies.length; i++) {
      UserRecipes?.add(
        ConstrainedBox(
            constraints: BoxConstraints(),
            child: RecipeImage(
              imagePath:
                  "https://insanelygoodrecipes.com/wp-content/uploads/2021/05/Ground-Chicken-Meatballs-683x1024.png",
              on_Tap: () {
                Get.to(ViewRecipe(myRecipie: userOriginalRecipies[i],));

              },
            )),
      );
    };
    return UserRecipes;
  }

  //userSaved List
  Future<List<Widget>?> UserSavedRecipies(
      {List<Widget>? UserSavedRecipes, String? userId}) async {
    List<savedRecipe> savedRecipies =await readUserSavedRecipies(userID: userId);

    for (var i = 0; i < savedRecipies.length; i++) {
      UserSavedRecipes?.add(
        ConstrainedBox(
            constraints: BoxConstraints(),
            child: RecipeImage(
              imagePath:
                  "https://insanelygoodrecipes.com/wp-content/uploads/2021/05/Ground-Chicken-Meatballs-683x1024.png",
              on_Tap: () {
               

              },
            )),
      );
    }
    ;

    return UserSavedRecipes;
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
                  "https://insanelygoodrecipes.com/wp-content/uploads/2021/05/Ground-Chicken-Meatballs-683x1024.png",
              on_Tap: () {
                Get.to( viewMyForkedRecipie(myRecipie: innovationsRecipies[i],));

              },
            )),
      );
    }
    ;

    return userInnovations;
  }
}
