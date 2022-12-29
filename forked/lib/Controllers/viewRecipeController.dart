import 'package:flutter/material.dart';
import 'package:forked/Components/Camera.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/createRecipeController.dart';
import 'package:forked/Views/CreateRecipe.dart';
import 'package:get/get.dart';

import '../Components/CardRecipeCard.dart';
import '../Components/RecipeImage.dart';
import '../Components/preparations_details.dart';
import '../Models/forkedRecipe.dart';
import '../Services/FireStoreRequests/forkedRecipeRequests.dart';
import '../Views/viewForkedRecippie.dart';

class viewRecipeController extends GetxController {
  int? currentIndex = 0;
  List<Widget>? steps = [];
  List<Widget>? ingredients = [];
  List<Widget>? forks;

  String parentID = "";
  List<String> ingredientList = [];
  List<String> stepsList = [];
  String? title,id;
  int? cal, min, serv;

  
  setIndex({required int index}) {
    currentIndex = index;

    update();
  }

  @override
  ooCon() async {
    forks = [];
    forks = await getRecipieForks(forksOfRecipie: forks, parentID: parentID);
    
    update();
  }
  

  Future<List<Widget>?> getRecipieForks(
      {List<Widget>? forksOfRecipie, String? parentID}) async {
    List<forkedRecipe> innovationsRecipies =
        await readOriginalForkedlRecipies(parentID: parentID);
    if (innovationsRecipies.length == 0) {
      forksOfRecipie?.add(InkWell(
          onTap: () => Get.to(createRecipe(
                steps: stepsList,
                ingredients: ingredientList,
                title: title,
                min: min,
                serv: serv,
                cal: cal,
                  parentID: parentID,
              ))!
                  .then((value) => Get.delete<createRecipeController>()),
          child: myCamera()));
    }
    for (var i = 0; i < innovationsRecipies.length; i++) {
      if (i == 2) {
        forksOfRecipie?.add(InkWell(
            onTap: () => Get.to(createRecipe(
                steps: stepsList,
                ingredients: ingredientList,
                title: title,
                min: min,
                serv: serv,
                cal: cal,
                  parentID: parentID,
              ))!
                  .then((value) => Get.delete<createRecipeController>()),
            child: myCamera()));
      }
      forksOfRecipie?.add(
        ConstrainedBox(
            constraints: BoxConstraints(),
            child: RecipeImage(
              imagePath:
                  "${innovationsRecipies[i].imgPath}",
              on_Tap: () {   Get.to(viewMyForkedRecipie(myRecipie: innovationsRecipies[i],))!.then((value) => Get.delete<viewRecipeController>());
},
            )),
      );
    }
    ;
    if (innovationsRecipies.length == 1 || innovationsRecipies.length == 2) {
      forksOfRecipie?.add(InkWell(
          onTap: () => Get.to(createRecipe(
                steps: stepsList,
                ingredients: ingredientList,
                title: title,
                min: min,
                serv: serv,
                cal: cal,
                parentID: id,
              ))!
                  .then((value) => Get.delete<createRecipeController>()),
          child: myCamera()));
    }

    return forksOfRecipie;
  }


  
}
