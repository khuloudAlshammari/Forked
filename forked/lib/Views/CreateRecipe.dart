import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forked/Components/Camera.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/TextFieldCom.dart';
import 'package:forked/Constants/styles.dart';
import 'package:get/get.dart';

import '../Controllers/createRecipeController.dart';
import '../Services/Image Services/ImagePicker.dart';

// this page should take a list of CameraXstep and another list of ingerdietStEXTfIELD, in case the 
//user forked a recipe, we will display them before the getBuilder because they are fixed, unless the user deleted one of them, 


class createRecipe extends StatelessWidget {
int truing=1;
  List<String>? steps;
 List<String>?  ingredients;
 String? title,parentID;
 int? cal,min,serv;
int forking=0;
   createRecipeController myRecipeController=Get.put(createRecipeController());

  String? header;
   createRecipe({super.key, this.steps,this.ingredients, this.cal=0,this.min=0,this.title="",this.serv=0, this.parentID=""}){
     if(this.serv==null){
       this.serv==0;
     }
 if(this.title==null){
       this.title=="";
     }

 if(this.min==null){
       this.min==0;
     }
 if(this.cal==null){
       this.cal==0;
     }
     if(this.parentID==null){
       this.parentID=="";
     }
 myRecipeController.parentID=parentID.toString();
    
myRecipeController.parentName=title.toString();

myRecipeController.calories.text="${this.cal}";
myRecipeController.minutes.text="${this.min}";
myRecipeController.servings.text="${this.serv}";
myRecipeController.title.text=title.toString();


     if(steps!=null){
       header="make it your own";
       myRecipeController.steps=steps;
     myRecipeController.ingredients=ingredients;


     }else {
       header="create a new recipe";
            myRecipeController.steps=[];
     myRecipeController.ingredients=[];
     }
   }

   TextEditingController c= TextEditingController();

    

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
                GetBuilder<createRecipeController>(
                  builder: (e){return   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                          myRecipeController.image!="imageTesting"? Container(
                      height: Get.height * (200 / 852),
                      width: Get.width * (172 / 393),
                    
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(myRecipeController.image))):SizedBox()
           ,
                      myCamera(funct: ()async{
                
                      myRecipeController.image=await  openAndUploadPic(identifier: "${ Random().nextInt(100000)}");
                        myRecipeController.update();
                      },),
                
                
                    
                    ],
                  );}
                ),
              
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
                        "Derived from ${title}",
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
                 if(truing==1){ truing++;  myRecipeController.addForkedFields();}
            //    if(steps !=null && steps!=[] && ingredients !=null && ingredients!=[] && forking==0 ){
            //    print("object");
            // //  myRecipeController.addForkedFields(steps: steps,ingredients: ingredients);
            //  forking++;
            //  }


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
            



           if(title==""){ await myRecipeController.createTheRecipe();}else{
 await myRecipeController.createTheForkedRecipe();

// myRecipeController.calories.text="";
// myRecipeController.minutes.text="";
// myRecipeController.title.text="";
// myRecipeController.servings.text="";
// myRecipeController.ingredientsTextEdittingControler=[];
// myRecipeController.ingredients=[];
// myRecipeController.ingredientsTextFielsAndX=[];
// myRecipeController.stepTextField=[];
// myRecipeController.stepsTextEdittingControler=[];
// myRecipeController.image="";


            //  await myRecipeController.cre();
           }
           
           },
             child: myButton(text: "Save", backGroundColor: BrightGreen,)),
         ],
       ),


       
       
          ],
        ),
      ),
    );
  }
}
