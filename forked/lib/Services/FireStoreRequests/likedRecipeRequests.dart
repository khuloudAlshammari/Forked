
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:forked/Models/likedRecipe.dart';

final db = FirebaseFirestore.instance;

 createLiked({required String recipeID,required String userID}) async {
  // User appt =
  //     User(userID: id, email: email);
try{


  await db.collection('likedRecipe').doc("${userID}_${recipeID}").set({"userID":userID, "recipeID":recipeID});

}catch(err){
Get.snackbar("title", "error inside createLiked");



}
}


 deleteLiked({required String likedRecipieID})async{
  try{


await db.collection("likedRecipe").doc(likedRecipieID).delete();


  }catch(ee){


Get.snackbar("title", "error inside deleteLiked");



  }
}






Future<List<likedRecipe>> readUsersLikedRecipies({String? userID})async{

List<likedRecipe> userLikedRecipe=[];
try{
  await FirebaseFirestore.instance
    .collection('likedRecipe').
   where('userID', isEqualTo: userID ) // we need to change username to userName
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
userLikedRecipe.add(likedRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });

for (var element in userLikedRecipe) {
Get.snackbar("title", element.recipeID.toString());
}
return userLikedRecipe;
}catch(err){
return userLikedRecipe;

}
}

