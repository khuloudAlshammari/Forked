import 'package:flutter/material.dart';
import 'package:forked/Models/User.dart';
import 'package:forked/Services/FireStoreRequests/RiecipeRequests.dart';
import 'package:forked/main.dart';
import 'package:get/get.dart';
import '../Components/addField.dart';
import '../Services/FireStoreRequests/forkedRecipeRequests.dart';

class createRecipeController extends GetxController {
  List<TextEditingController>  ingredientsTextEdittingControler = [];
   List<Widget> ingredientsTextFielsAndX=[];

  List<TextEditingController> stepsTextEdittingControler = [];
  List<String> stepImage = [];

   List<Widget> stepTextField=[];
   
int truing=1;
  // CreateRecipe controller will recieve steps and ingredient field lists which have
  // widget of add field but with initial value and a image for steps, i will loop through the
  // lists and add them in the addForked fields, also i will make sure to add controllers to them as
  // well

  @override
  String parentName="", parentID="";
  TextEditingController title = TextEditingController();
  TextEditingController minutes = TextEditingController();

  TextEditingController calories = TextEditingController();

  TextEditingController servings = TextEditingController();

  String image="imageTesting";


   List<String>? steps=[];
 List<String>?  ingredients=[];

  @override
  
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  



  // var texFXIndex = ingredientsTextEdittingControler.length;
  //   var textCont = ingredientsTextEdittingControler.length;
  //   ingredientsTextEdittingControler.add(TextEditingController());

  //   ingredientsTextFielsAndX.add(Padding(
  //     padding: const EdgeInsets.only(top: 10, bottom: 10),
  //     child: addFeild(
  //       textController: ingredientsTextEdittingControler[
  //           ingredientsTextEdittingControler.length - 1],
  //       deletingFunction: () {
  //         ingredientsTextEdittingControler
  //             .replaceRange(texFXIndex, texFXIndex+1, [TextEditingController(text: "")]);

  //         ingredientsTextFielsAndX
  //             .replaceRange(texFXIndex, texFXIndex + 1, [SizedBox()]);
  //         update();
  //       },
  //     ),

  //     //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
  //   ));


  // var stepIndex = stepsTextEdittingControler.length;
  //   var stepConINDEX = stepsTextEdittingControler.length;
  //   stepsTextEdittingControler.add(TextEditingController(text: ""));

  //   stepTextField.add(Padding(
  //     padding: const EdgeInsets.only(top: 10, bottom: 10),
  //     child: addFeild(
  //       imageFunction: () {
  //         stepImage.add("value");
  //       },
  //       textController:
  //           stepsTextEdittingControler[stepsTextEdittingControler.length - 1],
  //       deletingFunction: () {
  //         stepsTextEdittingControler
  //             .replaceRange(0, 1, [TextEditingController(text:"")]);

  //         stepTextField.replaceRange(stepIndex, stepIndex + 1, [SizedBox()]);
  //         update();
  //       },
  //     ),

  //     //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
  //   ));

    update();
  }

  addIngredient() {
    var texFXIndex = ingredientsTextEdittingControler.length;
    var textCont = ingredientsTextEdittingControler.length;
    ingredientsTextEdittingControler.add(TextEditingController());

    ingredientsTextFielsAndX.add(Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: addFeild(
        textController: ingredientsTextEdittingControler[
            ingredientsTextEdittingControler.length - 1],
        deletingFunction: () {
          ingredientsTextEdittingControler
              .replaceRange(textCont , textCont+1, [TextEditingController(text: "")]);

          ingredientsTextFielsAndX
              .replaceRange(texFXIndex, texFXIndex + 1, [SizedBox()]);
          update();
        },
      ),

      //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
    ));

    update();
  }

  addStep() {
    var texFXIndex = stepsTextEdittingControler.length;
    var textCont = stepsTextEdittingControler.length;
    stepsTextEdittingControler.add(TextEditingController(text: ""));

    stepTextField.add(Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: addFeild(
        imageFunction: () {
          stepImage.add("value");
        },
        textController:
            stepsTextEdittingControler[stepsTextEdittingControler.length - 1],
        deletingFunction: () {
          stepsTextEdittingControler
              .replaceRange(textCont, textCont+1, [TextEditingController(text:"")]);

          stepTextField.replaceRange(texFXIndex, texFXIndex + 1, [SizedBox()]);
          update();
        },
      ),

      //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
    ));

    update();

    for (var element in stepsTextEdittingControler) {
      if (element.runtimeType == TextEditingController) {
        print("object");
        TextEditingController b = element as TextEditingController;
        print(b.text);
      }
    }
  }

  addForkedFields() {
    // here we will handle the forked the recipe and get the needed textfIELDS


if(ingredients!=[]){
  for (var element in ingredients!) {
    

  var texFXIndex = ingredientsTextEdittingControler.length;
    var textCont = ingredientsTextEdittingControler.length;
    ingredientsTextEdittingControler.add(TextEditingController(text: element));

    ingredientsTextFielsAndX.add(Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: addFeild(
        textController: ingredientsTextEdittingControler[
            ingredientsTextEdittingControler.length - 1],
        deletingFunction: () {
          ingredientsTextEdittingControler
              .replaceRange(texFXIndex, texFXIndex+1, [TextEditingController(text: "")]);

          ingredientsTextFielsAndX
              .replaceRange(texFXIndex, texFXIndex + 1, [SizedBox()]);
          update();
        },
      ),

      //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
    ));


  }
}


if(steps!=[]){
  for (var element in steps!) {
    


  var stepIndex = stepsTextEdittingControler.length;
    var stepConINDEX = stepsTextEdittingControler.length;
    stepsTextEdittingControler.add(TextEditingController(text: element));

    stepTextField.add(Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: addFeild(
        imageFunction: () {
          stepImage.add("value");
        },
        textController:
            stepsTextEdittingControler[stepsTextEdittingControler.length - 1],
        deletingFunction: () {
          stepsTextEdittingControler
              .replaceRange(stepIndex, stepIndex+1, [TextEditingController(text:"")]);

          stepTextField.replaceRange(stepIndex, stepIndex + 1, [SizedBox()]);
          update();
        },
      ),

      //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
    ));


  }

}



    // print("object");

    // for (var element in steps!) {
    //   var texFXIndex = stepsTextEdittingControler.length;
    //   var textCont = stepsTextEdittingControler.length;
    //   stepsTextEdittingControler
    //       .add(TextEditingController(text: "Testing the forked steps"));

    //   stepTextField.add(Padding(
    //     padding: const EdgeInsets.only(top: 10, bottom: 10),
    //     child: addFeild(
    //       imageFunction: () {
    //         stepImage.add("value");
    //       },
    //       textController:
    //           stepsTextEdittingControler[stepsTextEdittingControler.length - 1],
    //       deletingFunction: () {
    //         stepsTextEdittingControler
    //             .replaceRange(textCont - 1, textCont, [TextEditingController(text:"")]);

    //         stepTextField
    //             .replaceRange(texFXIndex, texFXIndex + 1, [SizedBox()]);
    //         update();
    //       },
    //     ),

    //     //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
    //   ));
    // }

    // for (var element in ingredients!) {
    //   var texFXIndex = ingredientsTextEdittingControler.length;
    //   var textCont = ingredientsTextEdittingControler.length;
    //   ingredientsTextEdittingControler.add(TextEditingController(
    //     text: "testing steps forked",
    //   ));

    //   ingredientsTextFielsAndX.add(Padding(
    //     padding: const EdgeInsets.only(top: 10, bottom: 10),
    //     child: addFeild(
    //       textController: ingredientsTextEdittingControler[
    //           ingredientsTextEdittingControler.length - 1],
    //       deletingFunction: () {
    //         ingredientsTextEdittingControler
    //             .replaceRange(textCont - 1, textCont, [TextEditingController(text: "")]);

    //         ingredientsTextFielsAndX
    //             .replaceRange(texFXIndex, texFXIndex + 1, [SizedBox()]);
    //         update();
    //       },
    //     ),

    //     //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
    //   ));
    // }


  var texFXIndex = ingredientsTextEdittingControler.length;
    var textCont = ingredientsTextEdittingControler.length;
    ingredientsTextEdittingControler.add(TextEditingController());

    ingredientsTextFielsAndX.add(Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: addFeild(
        textController: ingredientsTextEdittingControler[
            ingredientsTextEdittingControler.length - 1],
        deletingFunction: () {
          ingredientsTextEdittingControler
              .replaceRange(texFXIndex, texFXIndex+1, [TextEditingController(text: "")]);

          ingredientsTextFielsAndX
              .replaceRange(texFXIndex, texFXIndex + 1, [SizedBox()]);
          update();
        },
      ),

      //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
    ));


  var stepIndex = stepsTextEdittingControler.length;
    var stepConINDEX = stepsTextEdittingControler.length;
    stepsTextEdittingControler.add(TextEditingController(text: ""));

    stepTextField.add(Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: addFeild(
        imageFunction: () {
          stepImage.add("value");
        },
        textController:
            stepsTextEdittingControler[stepsTextEdittingControler.length - 1],
        deletingFunction: () {
          stepsTextEdittingControler
              .replaceRange(0, 1, [TextEditingController(text:"")]);

          stepTextField.replaceRange(stepIndex, stepIndex + 1, [SizedBox()]);
          update();
        },
      ),

      //  child: TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png", Controller: ingredientsTextEdittingControler[0],),
    ));

  }















  createTheRecipe()async{

String ingredients="";
String steps="";



for(var i=0; i<ingredientsTextEdittingControler.length;i++){

if(ingredientsTextEdittingControler[i].text!=""){
  if(i!=ingredientsTextEdittingControler.length){
      ingredients="${ingredients}${ingredientsTextEdittingControler[i].text}=_=";

  }else{
          ingredients="${ingredients}${ingredientsTextEdittingControler[i].text}";

  }
}


}





for(var i=0; i<stepsTextEdittingControler.length;i++){

if(stepsTextEdittingControler[i].text!=""){
  if(i!=stepsTextEdittingControler.length){
      steps="${steps}${stepsTextEdittingControler[i].text}=_=";

  }else{
          steps="${steps}${stepsTextEdittingControler[i].text}";

  }
  
  }
}




print(ingredients);
print(steps);


print(myUserData.userID);
    await setRecipe(
     
                      userID: myUserData.userID,
                      imgPath: image,
                      userProfileImage: myUserData.profileImage,
                      username: myUserData.username,
                      ingredients: ingredients,
                      preperation: steps,
                      calories: int.parse(calories.text),
                      servings:  int.parse(servings.text),
                      minutes:  int.parse(minutes.text),
                      likes: 0,
                      title: title.text
    );
  }






  createTheForkedRecipe()async{

String ingredients="";
String steps="";



for(var i=0; i<ingredientsTextEdittingControler.length;i++){

if(ingredientsTextEdittingControler[i].text!=""){
  if(i!=ingredientsTextEdittingControler.length){
      ingredients="${ingredients}${ingredientsTextEdittingControler[i].text}=_=";

  }else{
          ingredients="${ingredients}${ingredientsTextEdittingControler[i].text}";

  }
}


}





for(var i=0; i<stepsTextEdittingControler.length;i++){

if(stepsTextEdittingControler[i].text!=""){
  if(i!=stepsTextEdittingControler.length){
      steps="${steps}${stepsTextEdittingControler[i].text}=_=";

  }else{
          steps="${steps}${stepsTextEdittingControler[i].text}";

  }
  
  }
}




print(ingredients);
print(steps);


print(myUserData.userID);
    await setForkedRecipe(
                      parentID:parentID ,
                      parentName: parentName,
                      userID: myUserData.userID,
                      imgPath: image,
                      userProfileImage: myUserData.profileImage,
                      username: myUserData.username,
                      ingredients: ingredients,
                      preperation: steps,
                      calories: int.parse(calories.text),
                      servings:  int.parse(servings.text),
                      minutes:  int.parse(minutes.text),
                      likes: 0,
                      title: title.text
    );
  }


}


