import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:forked/Models/User.dart';
import 'package:forked/Views/RegistrationNav.dart';
import 'package:get/get.dart';

import '../../Components/startingMessage.dart';
import '../../Controllers/RegisterationNavController.dart';
import '../../Views/BNBar.dart';
import '../../main.dart';
import '../FireStoreRequests/RiecipeRequests.dart';
import '../FireStoreRequests/UserRequests.dart';
import '../FireStoreRequests/followingRequests.dart';
import '../FireStoreRequests/forkedRecipeRequests.dart';
import '../FireStoreRequests/likedRecipeRequests.dart';
import '../FireStoreRequests/savedRecipeRequests.dart';

var inctence = FirebaseAuth.instance;

createAccount(
    {required String email,
    required String password,
    required rePassword,
    required username}) async {
  try {
    var firestore = FirebaseFirestore.instance;
    bool check = false;
    await FirebaseFirestore.instance
        .collection('users')
        .where('username',
            isEqualTo: username) // we need to change username to userName
        .get() //Future<QuerySnapshot<Map<String, dynamic>>>
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        check = true;
      });
    });
    if (check == false && password == rePassword) {
      var user = await inctence.createUserWithEmailAndPassword(
          email: email, password: password);

      print(user.user?.uid);

      if (user.user?.uid != null) {
        await setUser(email: email, id: user.user!.uid, username: username,);
       myUserData.username=username;
      myUserData.email=email;
             myUserData.userID=user.user!.uid;
        


        Get.offAll(BNBart());

        if (user.user?.uid != null) {
          Get.offAll(BNBart());
        }
      }
    }
  } catch (w) {
    Get.snackbar("ERROR", w.toString());
  }
}

loginWithPass({required String email, required String password}) async {
  try {
    var myUser = await inctence.signInWithEmailAndPassword(
        email: email, password: password);
    if (myUser.user?.uid != null) {
      try {
        myUserData = await readUserData(userID: myUser.user?.uid);
        // userOriginalRecipies =
        //     await readUsersOriginalRecipies(userID: myUser.user?.uid);
        // userForkedRecipeRecipies =
        //     await readUsersForkedlRecipies(userID: myUser.user?.uid);
        usersLikedRecipies =
            await readUsersLikedRecipies(userID: myUser.user?.uid);
        // userSavedRecipies =
        //     await readUserSavedRecipies(userID: myUser.user?.uid);
        userFollowing = await readUsersFollowing(userID: myUser.user?.uid);
        print(userFollowing.toString());
        userFollowers = await readUsersFollowers(userID: myUser.user?.uid);

        //Get.snackbar("title", "snack.username.toString()");
        Get.offAll(BNBart());
      } catch (err) {
       // Get.snackbar("title", "LKLLKLKLKLLK");
      }
    }
  } on FirebaseAuthException catch (err) {}
}

setEmail({required String email}) {
  try {
    print("dddddlkasdlawdkaa");
    print(email);
    print(inctence.currentUser?.uid);
    inctence.currentUser?.updateEmail(email);
    print("fffwlkeflmwefkjlefjlwekfjwef");
  } catch (err) {
    print(err);
    print("objekllklklkklklkllklkklkllkklklklklklklklkllkkllkct");
  }
}
signOut() async {
  try {
    var user = await inctence.signOut();
    // Get.delete<RegisterationController>();
    Get.offAll(start());
  } catch (error) {}
}


passwordReset({required String email}) async {
  try {
    await inctence.sendPasswordResetEmail(email: email);

    Get.snackbar("SUCCESS", "Password reset link sent . Check your email ");
  } on FirebaseAuthException catch (e) {
    Get.snackbar("ERROR", e.message.toString());
  }
}
