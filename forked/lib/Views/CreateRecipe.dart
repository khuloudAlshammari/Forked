import 'package:flutter/material.dart';
import 'package:forked/Components/Camera.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/TextFieldCom.dart';
import 'package:forked/Constants/styles.dart';
import 'package:get/get.dart';

import '../Controllers/createRecipeController.dart';

// this page should take a list of CameraXstep and another list of ingerdietStEXTfIELD, in case the 
//user forked a recipe, we will display them before the getBuilder because they are fixed, unless the user deleted one of them, 


class createRecipe extends StatelessWidget {

  List<Widget>? steps;
 List<Widget>?  ingredients;
int forking=0;
  String? header;
   createRecipe({super.key, this.steps,this.ingredients}){
     if(steps!=null){
       header="make it your own";
     }else {
       header="create a new recipe";
     }
   }

   TextEditingController c= TextEditingController();
   createRecipeController myRecipeController=Get.put(createRecipeController());

    

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // children: mycONTROLLER.MYreceipies
          children: [
            Text(
              header.toString(),
              style: h1,
            ),
            SizedBox(
              height: 34,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                myCamera(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Recipe Title",
              style: h2,
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldCom(
              Controller: myRecipeController.title,
              IconImage: "images/receipeTitel.png",
              borderColor: lightGreen,
              hint_Text: "recipe name",
            ),
           steps!=null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Derived from Pancake",
                        style: h3,
                      )
                    ],
                  )
                : SizedBox(
                    height: 15,
                  ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Minutes",
                      style: h2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: Get.width * .25, maxHeight: 70),
                      child: TextFieldCom(
                       Controller: myRecipeController.minutes,

                        borderColor: lightGreen,
                        IconImage: 'images/time.png',
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Servings",
                      style: h2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: Get.width * .25, maxHeight: 70),
                      child: TextFieldCom(
                            Controller: myRecipeController.servings,

                        borderColor: lightGreen,
                        IconImage: 'images/time.png',
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Calories",
                      style: h2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: Get.width * .25, maxHeight: 70),
                      child: TextFieldCom(
                        Controller: myRecipeController.calories,

                        borderColor: lightGreen,
                        IconImage: 'images/time.png',
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ingredients",
              style: h2,
            ),
            SizedBox(
              height: 20,
            ),
            // TextFieldCom(borderColor: lightGreen, IconImage: "images/add.png"),
            GetBuilder<createRecipeController>(builder: (w){

               if(steps !=null && steps!=[] && ingredients !=null && ingredients!=[] && forking==0 ){
               print("object");
             myRecipeController.addForkedFields(steps: steps,ingredients: ingredients);
             forking++;
             }


              return    Column(
                children: myRecipeController.ingredientsTextFielsAndX,
              );
            }),
         
             SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    myRecipeController.addIngredient();
                  },
                  child: myButton(text: "add ingredient", backGroundColor: BrightGreen, )),
              ],
            ),
    
    
         
           GetBuilder<createRecipeController>(builder: (w){

            

              return    Column(
                children: myRecipeController.stepTextField,
              );
            }),
         
             SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    myRecipeController.addStep();
                  },
                  child: myButton(text: "add steps", backGroundColor: BrightGreen, )),
              ],
            ),
       
       
       
       SizedBox(height: 80,),


       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           InkWell(
          onTap: ()async{
            
            await myRecipeController.createTheRecipe();},
             child: myButton(text: "Save", backGroundColor: BrightGreen,)),
               myButton(text: "Cancel", backGroundColor: BrightGreen,),
         ],
       ),


       
       
          ],
        ),
      ),
    );
  }
}
