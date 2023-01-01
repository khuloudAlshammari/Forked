import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CardRecipeCard.dart';
import 'package:get/get.dart';

import '../Controllers/followControler.dart';
import '../Models/following.dart';

class viewFollowers extends StatelessWidget {
  List<following> followers=[];
  int? i;
       followersControler myController= Get.put(followersControler());

   viewFollowers({super.key,required this.followers, this.i=0}){

     myController.getFollowers(follow: followers, i:i);
     
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                                  width: Get.width ,
                                  height: Get.height,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .02),
                                  child: GetBuilder<followersControler>(
                                    builder: (e){return GridView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                        
                                           myController.widgets.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: .74,
                                          crossAxisCount: 3,
                                        ),
                                        itemBuilder: (context, index) {
                                          return  myController.widgets[index];
                                        });}
                                  ),
                                ),
    );
  }
}
