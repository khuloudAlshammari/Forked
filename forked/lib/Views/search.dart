import 'package:flutter/material.dart';
import 'package:forked/Constants/styles.dart';
import 'package:get/get.dart';

import '../Controllers/searchController.dart';
class searchPage extends StatelessWidget {
  String searchKey;
  searchController myController= Get.put(searchController());
   searchPage({super.key, required this.searchKey}){
     myController.searchFor(searchKey: searchKey);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Container(
          height: Get.height*1.2,
          width: Get.width,
          child: Column(
      
            children: [
      
                //  GetBuilder<searchController>(builder: (er) {
                //       return 
                //     }),
      
      
      
      
      
                    Expanded(flex: 1,
                      child: GetBuilder<searchController>(
                        builder:(e){
                          double h=.3;
                          if(myController.accountsWidgets.length<1){
                            h=0;
                          }
                          return Container(
                                        width: Get.width ,
                                    
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height *
                                                .02),
                                        child: Column(
                                          children: [
                                            
                                       myController.accountsWidgets==[]? SizedBox():     Container(
                        width: Get.width ,
                        height: Get.height * h,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .02),
                        child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: myController.accountsWidgets.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, childAspectRatio: 1.3),
                            itemBuilder: (context, index) {
                              return myController.accountsWidgets[index];
                            }),
                      ),
      
                        Center(child: Container(
                          height: 2,
                          color: lightGreen,
                          width: Get.width*.8,
                          margin: EdgeInsets.only(top: 40,bottom: 10),
                        )),
                                            Expanded(
                                              child: Container(
                                                width: Get.width,
                                                child: GridView.builder(
                                                  scrollDirection: Axis.vertical,
                                                  itemCount:
                                                  
                                                      myController.recipies.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                        childAspectRatio: 1,
                                                    crossAxisCount: 1,
                                                  ),
                                                  itemBuilder: (context, index) {
                                                    return 
                                                        myController.recipies[index];
                                                  }),
                                              ),
                                            ),
                                              
                                              ]
                                        ),
                                      );}
                      ),
                    ),
            ],
          ),
        ),
         ] ),
    );
  }
}