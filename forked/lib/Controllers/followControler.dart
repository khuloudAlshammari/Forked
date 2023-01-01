


import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Components/userDisplay.dart';
import '../Models/User.dart';
import '../Models/following.dart';
import '../Services/FireStoreRequests/allRequests.dart';
import '../Services/FireStoreRequests/followingRequests.dart';
import '../Views/othersProfile.dart';
import 'OthersProfileController.dart';
class followersControler extends GetxController{

  List<Widget>  widgets=[];



  getFollowers({required List<following> follow, int? i})async{

try{ List<String> ids=[];
if(i!=1){
for (var element in follow) {
  ids.add(element.userID.toString());
}}else{
  for (var element in follow) {

  ids.add(element.followedUserID.toString());
}
}
List<user>  followers;


 followers= await readUsers(followingIDs: ids);
List<Widget> d=[];
for (var i=0;i<followers.length;  i++) {
 

  d.add(Container(
          // height: Get.height * .27,
          // width: Get.width * .4,
          child: UserDisplay(
            folowers: followers[i].followersNumber!,
            userName: followers[i].username!,
            image: followers[i].userProfileImage,
            funct: () async{
              List<following> userFollowingCount = await readUsersFollowing(userID: followers[i].userID.toString());
     List<following> userFollowersCount =
            await readUsersFollowers(userID: followers[i].userID.toString());
              Get.to(othersProfile(
                listOfFollowersCount:userFollowersCount ,
                listOfFollowingCount: userFollowingCount,
                otherUser: followers[i], 
              ))!.then((value) => Get.delete<OthersProfileController>());
            },
          ),
        ));



}

widgets=d;

}catch(err){}


update();
  }

}