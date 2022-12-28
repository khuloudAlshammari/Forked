



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController{
 
 void changetLang (String codelang){
 Locale locale = Locale(codelang);
 Get.updateLocale(locale);

 }



}