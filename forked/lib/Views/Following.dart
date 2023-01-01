import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CardRecipeCard.dart';
import 'package:get/get.dart';

class Following extends StatelessWidget {
  List<Widget> widgets=[];
   Following({super.key,required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child:  Container(
                                  width: Get.width ,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .02),
                                  child: GridView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                      
                                          widgets.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 1,
                                        crossAxisCount: 1,
                                      ),
                                      itemBuilder: (context, index) {
                                        return 
                                            widgets[index];
                                      }),
                                ),
      ),
    );
  }
}
