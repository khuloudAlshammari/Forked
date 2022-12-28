import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forked/Components/Language/Language.dart';

import 'package:forked/Components/textField.dart';
import 'package:forked/Controllers/languageController.dart';
import 'package:forked/Views/CreateRecipe.dart';
import 'package:forked/Views/ViewRecipe.dart';
import 'package:forked/Views/khuloudTest.dart';
import 'package:forked/Views/test.dart';
import 'package:forked/Views/testing.dart';

import 'package:get/get.dart';
import 'package:forked/Routes/Router.dart';
import 'package:forked/Views/RegistrationNav.dart';
import 'firebase_options.dart';


main()async {

   WidgetsFlutterBinding.ensureInitialized();
   
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   // Get.put(MyLocaleController());
    return GetMaterialApp(
        initialRoute: NamedRoute.StratingPage,
         getPages: appRoutes,

//locale: Get.deviceLocale,
     // translations: Language(),


    

  home:

     createRecipe(

  steps: [

    SizedBox(),
     SizedBox(),

    SizedBox(),

   ],


  ingredients: [

    SizedBox(),

     SizedBox(),

  ],

   ),




    );
  }
}
