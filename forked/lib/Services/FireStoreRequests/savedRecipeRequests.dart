
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forked/Models/savedRecipe.dart';
import 'package:get/get.dart';

final db = FirebaseFirestore.instance;

createSaved({required String recipeID,required String userID}) async {
 
  // User appt =
  //     User(userID: id, email: email);
try{


  await db.collection('savedRecipies').doc("${userID}_${recipeID}").set({"userID":userID, "recipeID":recipeID});

}catch(err){
//Get.snackbar("title", "error inside createSaved");
}
}


deleteSaved({required String savedRecipieID})async{
  try{


await db.collection("savedRecipies").doc(savedRecipieID).delete();

  }catch(ee){


//Get.snackbar("title", "error inside deleteLiked");


  }
}






Future<List<savedRecipe>> readUserSavedRecipies({String? userID})async{

List<savedRecipe> userLikedRecipe=[];
try{
  await FirebaseFirestore.instance
    .collection('savedRecipies').
   where('userID', isEqualTo: userID ) // we need to change username to userName
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
userLikedRecipe.add(savedRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });

for (var element in userLikedRecipe) {
//Get.snackbar("title", element.recipeID.toString());
}
return userLikedRecipe;
}catch(err){
return userLikedRecipe;

}
}

