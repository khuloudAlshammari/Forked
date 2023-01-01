import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forked/Models/User.dart';
import 'package:get/get.dart';

final db = FirebaseFirestore.instance;

updateData(
    {required String collection,
    required String docoment,
    required String fieldKey,
    required var newValue}) async {
  try {
    await db.collection(collection).doc(docoment).update({fieldKey: newValue});
    //Get.snackbar("SUCCESS", "Successfully update");
  } catch (e) {
    //Get.snackbar("ERROR", "An error ocur");
  }
}

setUser({required String email, required String id, String? username}) async {
  // User appt =
  //     User(userID: id, email: email);
  try {
    await db
        .collection('users')
        .doc(id)
        .set({"userID": id, "email": email, "username": username,"followersNumber":0,
        "userProfileImage":"https://freesvg.org/img/abstract-user-flat-4.png",
        
        });
  } catch (err) {
    //Get.snackbar("title", "error inside SETUSER");
  }
}

Future<user> readUserData({String? userID}) async {
  user returned = user();

  try {
    await db.collection("users").doc(userID).get().then(
      (DocumentSnapshot doc) {
        returned = user.fronJson(doc.data() as Map<String, dynamic>);
       // Get.snackbar("title", "trueee"); // ...
      },
    );

    return returned;
  } catch (err) {
    //Get.snackbar("title", "readUser");
    return returned;
  }
}

// this was changed from where, to orderBy
Future<List<user>> usersFollowersQuery() async {
  List<user> mostFollowedUsers = [];
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .orderBy('followersNumber',
            descending: true) // we need to change username to userName
        .get() //Future<QuerySnapshot<Map<String, dynamic>>>
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // QuerySnapshot<Object?>
        mostFollowedUsers
            .add(user.fronJson(doc.data() as Map<String, dynamic>));
      });

    });

    for (var element in mostFollowedUsers) {
      print(element.followersNumber);
    }
    return mostFollowedUsers;
  } catch (e) {
    return mostFollowedUsers;
  }
}

Future<List<user>> readAllUsers() async {
  List<user> allUsers = [];
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .get() //Future<QuerySnapshot<Map<String, dynamic>>>
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // QuerySnapshot<Object?>

        allUsers.add(user.fronJson(doc.data() as Map<String, dynamic>));
      });
    });

// for (var element in allUsers) {
// Get.snackbar("title", element.username.toString());
// }
    return allUsers;
  } catch (err) {
    return allUsers;
  }
}
