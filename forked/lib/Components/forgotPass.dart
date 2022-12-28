import 'package:flutter/material.dart';
import 'package:forked/Services/FireBaseAuth/EmailPass.dart';
import 'package:get/get.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/MyTextFeild.dart';

import '../Constants/styles.dart';
import '../Controllers/RegisterationNavController.dart';

class forgotPass extends StatelessWidget {
  RegisterationController myController;
  TextEditingController resetPassword = TextEditingController();

  forgotPass({super.key, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
                width: Get.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password",
                  maxLines: 2,
                  style: h1,
                )),
          ),
          Expanded(
              flex: 4,
              child: myTextFeild(
                controller: resetPassword,
                hint: "Email",
                icon: Icons.email_outlined,
              )),
          Flexible(
              flex: 2,
              child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 40),
                  child: InkWell(
                      //
                      onTap: () {
                        passwordReset(email: resetPassword.text.trim());
                        
                      },
                      child: myButton(
                        text: "Send",
                        backGroundColor: lightGreen,
                      )))),
          SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () => myController.moveToLogin(),
                  child: Text(
                    "Back to login",
                    style: underline,
                  )))
        ],
      ),
    );
  }
}
