import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/bsckGroundIcon.dart';
import 'package:forked/Constants/styles.dart';
import 'package:get/get.dart';

class FollowAndUnfollow extends StatelessWidget {
  bool? isFollow ;
  String follow = 'Follow';
  String unfollow = 'UnFollow';
  
  Function()? onPressFollow , onPressUnFollow;

  FollowAndUnfollow({
    super.key,this.onPressFollow,
    this.onPressUnFollow, this.isFollow
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 45,
            width: Get.width * .24,
            child: ElevatedButton(
              onPressed: isFollow != true ? onPressFollow:onPressUnFollow ,
              child: Text(
                isFollow == true ?  unfollow:follow ,
                style: h3,
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: isFollow != true ? lightGreen:lightGrey,
                  padding: EdgeInsets.all(5)),
            ));
  }
}
