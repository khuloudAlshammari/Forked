import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Views/profileEdiet.dart';
import 'package:get/get.dart';

import '../Services/FireBaseAuth/EmailPass.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        spacing: 0,
        children: [
          SpeedDialChild(
            child: Image.asset("images/edit.png"),
            backgroundColor: lightGreen,
            elevation: 0,
            onTap: () => Get.to(ProfilEdiet()),
          ),
          SpeedDialChild(
            child: Icon(Icons.login),
            backgroundColor: lightGreen,
            elevation: 0,
            onTap: () {
              signOut();
            },
          )
        ],
      ),
    );
  }
}
