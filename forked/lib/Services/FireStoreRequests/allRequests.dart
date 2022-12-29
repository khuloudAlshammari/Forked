// setNewUser({String? userID, String? email}) {
// // create new document in the database with the id userID and email feild = to email
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forked/Models/User.dart';
import 'package:forked/Models/following.dart';
import 'package:forked/Models/forkedRecipe.dart';
import 'package:forked/Models/likedRecipe.dart';
import 'package:forked/Services/FireStoreRequests/RiecipeRequests.dart';
import 'package:forked/Services/FireStoreRequests/followingRequests.dart';
import 'package:forked/Services/FireStoreRequests/likedRecipeRequests.dart';
import 'package:forked/Services/FireStoreRequests/savedRecipeRequests.dart';
import 'package:get/get.dart';

import '../../Models/forkedRecipe.dart';
import '../../Models/originalRecipie.dart';
import '../../Models/savedRecipe.dart';
import 'UserRequests.dart';
import 'forkedRecipeRequests.dart';
final db = FirebaseFirestore.instance;

fetchUserData({String? userID}) async {
// we will get all the user information from the data base and store it
// this is not just a request for user collection, we will do multiple queries
//1- user dara+
//2- user's original recipies+
//3- users forked recipe+
// user liked recipe+
// user saved recipe+
// following+
// followers+
  user myUserData = await readUserData(userID: userID);
  List<originalRecipe> userOriginalRecipies =
      await readUsersOriginalRecipies(userID: userID);
  forkedRecipe userForkedRecipeRecipies =
      await readForkedRecipeData(recipeID: userID);
  List<likedRecipe> usersLikedRecipies =
      await readUsersLikedRecipies(userID: userID);
  List<savedRecipe> userSavedRecipies =
      await readUserSavedRecipies(userID: userID);
  List<following> userFollowing = await readUsersFollowing(userID: userID);
  List<following> userFollowers = await readUsersFollowers(userID: userID);
}


//ready
List<dynamic> explorer(
    {required String userID, required String recipeID, String? parentID}) {
  // return recipies where likes < 3 in both forked and original recipe;
// list item details:
//recipe title, image, likes, profileIMG, user name, useID, recipeID, and parentID for forked;

// when creating the forked Widget make sure to pass an atribute (parentID) that tell wether the recipe is forked or not

  return ["forkedRecipeies", "originaalRecipe"];
}

// done
List<dynamic> mostFollowed() {
  // return recipies where followers > 3;
  // profile image, name , followers;, id;
  return [];
}

//not ready+___+
Future<List<forkedRecipe>> FollowingForkedRecipies({List<String>? followingIDs}) async{
  // we will use the list of a ll the users that we followe to aquire their recipies

  // by using the (in) ley word in the query
  List<forkedRecipe> usersRecipies=[];

  try{

 await FirebaseFirestore.instance
    .collection('forkedRecipe').//++
   where('userID',  whereIn : followingIDs ) // we need to change username to userName
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
usersRecipies.add(forkedRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });
    for (var element in usersRecipies) {
      //Get.snackbar("title", element.title.toString());
    }
    return usersRecipies;
    }catch(err){
return [];
    }

  //for testing we will limit the floowingIDs to only 10 users

  //recipe title, image, likes, profileIMG, user name, useID, recipeID, and parentID for forked;

// when creating the forked Widget make sure to pass an atribute (parentID) that tell wether the recipe is forked or not

}

//not ready
Future<List<originalRecipe>> FollowingRecipies({List<String>? followingIDs}) async{
  // we will use the list of a ll the users that we followe to aquire their recipies

  // by using the (in) ley word in the query
  List<originalRecipe> usersRecipies=[];

  try{

 await FirebaseFirestore.instance
    .collection('recipes').//++
   where('userID',  whereIn : followingIDs ) // we need to change username to userName
    .get() //Future<QuerySnapshot<Map<String, dynamic>>>
    .then((QuerySnapshot querySnapshot) {
      
        querySnapshot.docs.forEach((doc) {// QuerySnapshot<Object?>
       
usersRecipies.add(originalRecipe.fronJson(doc.data() as Map<String, dynamic>));  

        });
    });
    for (var element in usersRecipies) {
      //Get.snackbar("title", element.title.toString());
    }
    return usersRecipies;
    }catch(err){
return [];
    }

  //for testing we will limit the floowingIDs to only 10 users

  //recipe title, image, likes, profileIMG, user name, useID, recipeID, and parentID for forked;

// when creating the forked Widget make sure to pass an atribute (parentID) that tell wether the recipe is forked or not

}

// we could merge viewOriginalReicipe with view forked recipies method
//done
List<dynamic> viewOriginalRecipe(
    {String? recipieDocId,
    int? displayedLikes,
    String? displayedProfileImageURL}) {
// no need for query for recipe because we have the id;
// simple get request to view recipe
// once we get the info of the recipe we will check if displayedLikes== likes , and displayedProfileImageURL== prOFILEIMAGEurl
// if does we will do  nothing, other than that we will update the data that changed
// and another query  to get forked recipies

  return ["recipe info", "forks"];
}

// we could merge viewOriginalReicipe with view forked recipies method
//done
List<dynamic> viewForkedRecipe(
    {String? recipieDocId,
    int? displayedLikes,
    String? displayedProfileImageURL}) {
// no need for query for forked recipe because we have the id;
// simple get request to view recipe
// once we get the info of the recipe we will check if displayedLikes== likes , and displayedProfileImageURL== prOFILEIMAGEurl
// if does we will do  nothing, other than that we will update the data that changed
// and another query  to get forked recipies

  return ["forked recipe info", "forks"];
}

// done
saveOrDeleteRecipe({String? recipeID, String? userID}) {
// we will check if a document with the id userID_recipeID exist
// if not we will add it, if it does exist we will delete it
}

// done
likeOrUnlikeRecipe({String? recipeID, String? userID}) {
// we will check if a document with the id userID_recipeID exist
// if not we will add it, if it does exist we will delete it
}

//ready
Future <List<dynamic>> viewOthersProfile({String? profileID, int? displayedFollowers}) async {
  // we will return thre items:
  // 1- original recipe
  //1 forked recipe
  //user data
  // and we will check if the displayedFollowers == followers
  // if not, set follower
  user myUserData = await readUserData(userID: profileID);
  List<originalRecipe> userOriginalRecipies =await readUsersOriginalRecipies(userID: profileID);
  forkedRecipe userForkedRecipeRecipies =await readForkedRecipeData(recipeID: profileID);


  return ["user data", " forks", "originals"];
}

//done
 displayFollowers({String? profileID}) async {
  // we will look throu the following collection
  // perform a query where userFollowed = profileID
 
  user myUserData = await readUserData(userID: profileID);
  List<originalRecipe> userOriginalRecipies =await readUsersOriginalRecipies(userID: profileID);
  forkedRecipe userForkedRecipeRecipies =await readForkedRecipeData(recipeID: profileID);
  List<likedRecipe> usersLikedRecipies =await readUsersLikedRecipies(userID: profileID);
  List<following> userFollowing = await readUsersFollowing(userID: profileID);
  List<following> userFollowers = await readUsersFollowers(userID: profileID);
  
}

//done
displayFolloweing({String? profileID}) {
  // we will look throu the following collection
  // perform a query where userFollowing = profileID

  return ["users"];
}

//done
followOrUnfollowUser({String? currentUserID, String? someUser}) {
// we will check if a document with the id userID_recipeID exist
// if not we will follow it, if it does exist we will unfollow
}

//not ready
UpdateUserProfile({String? userID, String? newProfile}) {
  // we also need to update image
// we will user profile with newProfile
}

//done
createOriginalRecipe({
  String? imgPath,
  String? recipeID,
  String? title,
  int? minutes,
  int? servings,
  int? calories,
  int? likes,
  String? ingredients,
  String? preperation,
  String? useId,
  String? userProfileImage,
  String? username,
}) {
  // we should create ne document in recipies with user id
}
//done
createForkedRecipe({
  String? imgPath,
  String? recipeID,
  String? title,
  int? minutes,
  int? servings,
  int? calories,
  int? likes,
  String? ingredients,
  String? preperation,
  String? useId,
  String? parentID,
  String? parentName,
  String? userProfileImage,
  String? username,
}) {}





















/// seaaaaaarching

  Future<List<user>> SsearchingInUsers({String? searchKey}) async {
  // we will yuse the key to look through the user documents and recipe documents
  // and we will return = [USELlIST, RecipeList];
  List<user> userList = await readAllUsers();


List<String> usersNames=[];


for (var element in userList) {
  usersNames.add(element.username!);
}



   List<user> finalUsers=[];
    
         
for(var i=0;i<usersNames.length;i++){
  if(usersNames[i].contains(searchKey!)){
    finalUsers.add(userList[i]);
  }
}





for (var element in finalUsers) {
  //Get.snackbar("user name", element.username!);
}

  return finalUsers;
}













 Future<List<originalRecipe>> SsearchingInOriginal({String? searchKey}) async {
  // we will yuse the key to look through the user documents and recipe documents
  // and we will return = [USELlIST, RecipeList];
  List<originalRecipe> originalRecipes =await readAllOriginalRecipies() ;
     



List<String> originalNames=[];

for (var element in originalRecipes) {
  originalNames.add(element.title!);
}

List<originalRecipe> finalOriginal=[];
       



for(var i=0;i<originalNames.length;i++){
  if(originalNames[i].contains(searchKey!)){
    finalOriginal.add(originalRecipes[i]);
  }
}




for (var element in finalOriginal) {
  //Get.snackbar("original title", element.title!);
}
  return finalOriginal;
}











 Future<List<forkedRecipe>>   SsearchingInForked({String? searchKey}) async {
  // we will yuse the key to look through the user documents and recipe documents
  // and we will return = [USELlIST, RecipeList];

     
  List<forkedRecipe> ForkedRecipe = await readAllforkedlRecipies();

List<String> forkedNames=[];




for (var element in ForkedRecipe) {
  forkedNames.add(element.title!);
}


List<forkedRecipe>  finalForked=[];        
         


for(var i=0;i<forkedNames.length;i++){
  if(forkedNames[i].contains(searchKey!)){
    print("entered");
    finalForked.add(ForkedRecipe[i]);
  }
}





for (var element in finalForked) {
  //Get.snackbar("forks title", element.title!);
}
  return finalForked;
}