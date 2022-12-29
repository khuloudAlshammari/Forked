import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forked/Models/originalRecipie.dart';
import 'package:get/get.dart';
final db = FirebaseFirestore.instance;

setRecipe(
    {String? userID,
    String? imgPath,
    String? title,
    int? minutes,
    int? servings,
    int? calories,
    int? likes,
    String? ingredients,
    String? preperation,
    String? userProfileImage,
    String? username}) async {
  // User appt =
  //     User(userID: id, email: email);
  try {
    final docRef = db.collection('recipes').doc();

    await docRef.set({
      "userID": userID,
      "username": username,
      "recipeID": docRef.id,
      "imgPath":imgPath,
      "title":title,
      "minutes":minutes,
      "servings":servings,
      "calories":calories,
      "likes":likes,
      "ingredients":ingredients,
      "preperation":preperation,
      "userProfileImage":userProfileImage,
   

    });
    Get.snackbar("title", "set recipe is working");
  } catch (err) {
    Get.snackbar("title", "error inside set recipe");
  }
}


Future<originalRecipe> readRecipeData({String? recipeID})async{
originalRecipe returned=originalRecipe();

 try{ 
   
   await db.collection("recipes").doc(recipeID).get().then(
  (DocumentSnapshot doc) {
returned= originalRecipe.fronJson(doc.data() as Map<String, dynamic>);  
Get.snackbar("title", returned.imgPath.toString());  // ...
  },
  
);

return returned;


 }catch(err){
  
  Get.snackbar("title", "readUser");
return returned;
  
  }

}





Future<List<originalRecipe>> readUsersOriginalRecipies({String? userID})async{

List<originalRecipe> userRecipies=[];
try{
  await FirebaseFirestore.instance
    .collection('recipes').
   where('userID', isEqualTo: userID ) // we need to change username to userName
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
userRecipies.add(originalRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });

for (var element in userRecipies) {
Get.snackbar("title", element.title.toString());
}
return userRecipies;
}
catch(err){
return userRecipies;
  

}

}









Future<List<originalRecipe>>  readAllOriginalRecipies()async{

List<originalRecipe> allRecipies=[];
try{
  await FirebaseFirestore.instance
    .collection('recipes')
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
allRecipies.add(originalRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });

// for (var element in allRecipies) {
// Get.snackbar("title", element.title.toString());
// }
return allRecipies;
}
catch(err){return allRecipies;
  

}

}