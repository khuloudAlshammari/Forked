import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/styles.dart';
//كمبونت الاب بار

AppBar myappBar = AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back_ios, color: darkGreen),
    onPressed: 
    () => Get.back(),
  ),
  shadowColor: Colors.lightGreen,
  backgroundColor: Colors.white,
  elevation: 1,
);
