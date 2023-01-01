import 'package:forked/Models/originalRecipie.dart';
// import 'package:forked/Models/Recipie.dart';

// i am not sure of how to handle arrays in factory, we need to check that ince we get the data

class user {
  String? userID;
  String? username;
  String? email;
  String? profile;
  String? userProfileImage;
  int? followingNumber;
  int? followersNumber;


  user(
      {this.userID,
      this.username,
      this.email,
      this.profile,
      this.userProfileImage,
      this.followingNumber,
      this.followersNumber});

  factory user.fronJson(Map json) {
    return user(
      userID: json['userID'],
      username: json['username'],
      email: json['email'],
      profile: json['profile'],
      userProfileImage: json['userProfileImage'],
       followingNumber: json['followingNumber'],
        followersNumber: json['followersNumber'],
    );
  }
}
