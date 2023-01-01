import 'package:flutter/material.dart';
import 'package:forked/Constants/styles.dart';
import 'package:get/get.dart';

class UserDisplay extends StatelessWidget {
  String userName;
  String? image;
  int folowers;
  Function()? funct;

  UserDisplay(
      {super.key,
      this.funct,
      required this.folowers,
      required this.userName,
      this.image}) {
    if (image == null) {
      image = defaultAvatar;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: InkWell(
        onTap: funct,
        child: Container(
          height: Get.height * (155 / 850),
          width: Get.width * (99 / 393),
          child: Stack(
            children: [
              FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    widthFactor: 99 / 99,
                    heightFactor: 120 / 155,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                              top: BorderSide(color: Color(0xff00A181)),
                              right: BorderSide(color: Color(0xff00A181)),
                              left: BorderSide(color: Color(0xff00A181)),
                              bottom: BorderSide(color: Color(0xff00A181)))),
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 99 / 99,
                heightFactor: 130 / 155,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              height: Get.width * (99 / 393) * (79 / 99),
                              width: Get.width * (99 / 393) * (79 / 99),
                              color: Colors.white,
                              child: Image.network(
                                "$image",
                                fit: BoxFit.fill,
                              ))),
                      FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "$userName",
                            style: userDisplayBold,
                          )),
                      FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "$folowers folowers",
                            style: UserDisplayLight,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
