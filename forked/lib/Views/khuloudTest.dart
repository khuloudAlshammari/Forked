


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/textField.dart';
import 'package:forked/Controllers/languageController.dart';
import 'package:get/get.dart';

class testKhuloud extends StatefulWidget {
  const testKhuloud({super.key});

  @override
  State<testKhuloud> createState() => _testKhuloudState();
}

class _testKhuloudState extends State<testKhuloud> {
  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 40, 40),
      body: Column(children: [

        SizedBox(height:50),
          TextButton(onPressed: (() {
            controllerLang.changetLang("ar");
          }),
           child:Text("Start".
           tr,style: TextStyle(fontSize: 30,color: Colors.white),)),
           Text("Forgot Password ?".tr),
           Text("add ingredient".tr),



           
    ]));
    }}


    
