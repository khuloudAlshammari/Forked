import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/bsckGroundIcon.dart';
import 'package:forked/Constants/styles.dart';
import 'package:get/get.dart';

class FollowAndUnfollow extends StatelessWidget {
  bool isFollow = true;
  String follow = 'Follow';
  String unfollow = 'UnFollow';
  Function()? onPress;

  FollowAndUnfollow({
    super.key,this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 45,
            width: Get.width * .24,
            child: ElevatedButton(
              onPressed: onPress,
              child: Text(
                isFollow ? follow : unfollow,
                style: h2,
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: lightGreen,
                  padding: EdgeInsets.all(5)),
            ));
  }
}
