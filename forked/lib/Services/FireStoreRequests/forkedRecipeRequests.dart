import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forked/Models/forkedRecipe.dart';
import 'package:forked/Models/originalRecipie.dart';
import 'package:get/get.dart';

final db = FirebaseFirestore.instance;

setForkedRecipe(
    {
    String? parentName,
    String? parentID,
    String? userID,
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
    final docRef = db.collection('forkedRecipe').doc();
if(imgPath!.length<30){
  imgPath="https://firebasestorage.googleapis.com/v0/b/forked-8c34b.appspot.com/o/AllImages%2F0.jpg?alt=media&token=6ef8c3e9-9910-4549-8ac3-a513d856bc21";
}
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
      "parentName":parentName,
      "parentID":parentID

    });
    //Get.snackbar("title", "set recipe is working");
  } catch (err) {
    //Get.snackbar("title", "error inside set recipe");
  }
}






 Future<forkedRecipe> readForkedRecipeData({String? recipeID})async{
forkedRecipe returned=forkedRecipe();

 try{ 
   
   await db.collection("forkedRecipe").doc(recipeID).get().then(
  (DocumentSnapshot doc) {
returned= forkedRecipe.fronJson(doc.data() as Map<String, dynamic>);  
//Get.snackbar("title", returned.imgPath.toString());  // ...
  },
  
);

return returned;


 }catch(err){
  
 // Get.snackbar("title", "readUser");
return returned;
  
  }

}





Future<List<forkedRecipe>> readUsersForkedlRecipies({String? userID})async{

List<forkedRecipe> userForkedRecipes=[];
try{
  await FirebaseFirestore.instance
    .collection('forkedRecipe').
   where('userID', isEqualTo: userID ) // we need to change username to userName
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
userForkedRecipes.add(forkedRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });

for (var element in userForkedRecipes) {
//Get.snackbar("title", element.title.toString());
}
return userForkedRecipes;
}catch(err){
return userForkedRecipes;


}


}






Future<List<forkedRecipe>>  readAllforkedlRecipies()async{

List<forkedRecipe> allRecipies=[];
try{
  await FirebaseFirestore.instance
    .collection('forkedRecipe')
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
allRecipies.add(forkedRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });

// for (var element in allRecipies) {
// Get.snackbar("title", element.title.toString());
// }
return allRecipies;
}
catch(err){
  
return allRecipies;

}

}




Future<List<forkedRecipe>> readOriginalForkedlRecipies({String? parentID})async{

List<forkedRecipe> OriginalForkedlRecipies=[];
try{
  await FirebaseFirestore.instance
    .collection('forkedRecipe').
   where('parentID', isEqualTo: parentID ) // we need to change username to userName
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
OriginalForkedlRecipies.add(forkedRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });

for (var element in OriginalForkedlRecipies) {
//Get.snackbar("title", element.title.toString());
}
return OriginalForkedlRecipies;
}catch(err){
return OriginalForkedlRecipies;


}


}