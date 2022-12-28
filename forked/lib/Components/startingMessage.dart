import 'package:flutter/material.dart';

import 'package:forked/Components/Titles.dart';

import 'package:forked/Components/textField.dart';
import 'package:forked/Controllers/languageController.dart';

import 'package:get/get.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/RegisterationNavController.dart';

class startingMessage extends StatelessWidget {
  RegisterationController myController;
   startingMessage({super.key, required this.myController});
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
   Expanded( flex: 10,
     child: Container(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Expanded(flex: 5,
             child: Container(
                    width: Get.width*.6,
                    child: Text("Give your day a fresh start", maxLines: 2, style: h1,)),
           ),
        
     

//  SizedBox(height: 10,),
          Expanded(flex: 1,
            child: Container(
              child: FractionallySizedBox(
                heightFactor: .04,
                child: Container(
                    height: 1,
                      width: Get.width*.5,
                      color: lightGreen,
                  
                 
                ),
              ),
            ),
          ),
                  Expanded(flex: 1, child: Container()),

          
        
         ],
       ),
     ),
   ),
   

      Expanded(
        flex: 10,
        child: Container(
      
              child: Stack(
          children: [
            Text("Start cooking whatever you crave . Get creative and create your own recipes. ", style: h3 ,)
              , Align(
                alignment: Alignment.bottomRight,
                child: FractionallySizedBox(
                  heightFactor: .4,
                  widthFactor: .4,
                  child: Container(
                      alignment: Alignment.bottomRight,
                      child:  InkWell(
                        onTap: ()=>myController.moveToLogin(),
                        child: myButton(text: "Start", backGroundColor: lightGreen,))
                      ),
                ),
              ),
         
            
              ],
              ),
            ),
      )
        ],
      ),
    );
  }
}