import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forked/Components/AppBar.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/MyTextFeild.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Services/FireStoreRequests/UserRequests.dart';
import 'package:forked/Views/Profile.dart';
import 'package:forked/main.dart';
import 'package:get/get.dart';

import '../Services/Image Services/ImagePicker.dart';

class ProfilEdiet extends StatelessWidget {
  ProfilEdiet({super.key});
  TextEditingController textController =
      TextEditingController(text: myUserData.profile.toString());
String? imagePath=myUserData.userProfileImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: Get.width * .85,
            //color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Text(
                    'Cancel',
                    style: h2,
                  ),
                  onTap: () => Get.back(),
                ),
                InkWell(
                  child: Text(
                    'Done',
                    style: h2,
                  ),
                  onTap: () {
                    updateData(
                        collection: "users",
                        docoment: "${myUserData.userID}",
                        fieldKey: "profile",
                        newValue: textController.text.toString());
                        myUserData.profile=textController.text.toString();
                    print(imagePath.toString());

                    updateData(
                        collection: "user",
                        docoment: "${myUserData.userID}",
                        fieldKey: "userProfileImage",
                        newValue:imagePath.toString());
                        myUserData.userProfileImage=imagePath.toString();


                    //Get.to(() => Profile(), arguments: myUserData.profile);
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage(myUserData.userProfileImage!),
                      fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // myButton(text: 'Chang Profil photo',backGroundColor: lightGreen,)
          Container(
              width: Get.width * .68,
              //padding: EdgeInsets.only(left: 40, right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: InkWell(
                onTap: ()async{
         imagePath=await  openAndUploadPic(identifier: "${myUserData.userID}");

                },
                child: myButton(
                  text: 'Change Profile Photo',
                  backGroundColor: lightGreen,
                ),
              )),

          SizedBox(
            height: 40,
          ),

          Center(
            child: Container(
              width: Get.width * 50,
              height: 50,
              //color: Colors.amber,
              child: myTextFeild(
                controller: textController,
                hint: myUserData.profile == null
                    ? ""
                    : myUserData.profile.toString(),
                icon: Icons.edit_note_rounded,
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
