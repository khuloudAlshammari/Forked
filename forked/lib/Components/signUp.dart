import 'package:flutter/material.dart';
import 'package:forked/Services/FireBaseAuth/EmailPass.dart';
import 'package:forked/Views/BNBar.dart';
import 'package:get/get.dart';
import 'package:forked/Components/CustomButton.dart';
import 'package:forked/Components/MyTextFeild.dart';

import '../Constants/styles.dart';
import '../Controllers/RegisterationNavController.dart';

class signUp extends StatelessWidget {
  RegisterationController myController;
  signUp({super.key, required this.myController});
  TextEditingController? username = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      rePassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Container(
                width: Get.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create an account",
                  maxLines: 2,
                  style: h1,
                )),
          ),
          Expanded(flex: 2, child: SizedBox()),
          Expanded(
              flex: 6,
              child: myTextFeild(
                controller: username,
                hint: "Username",
                icon: Icons.person_outline_rounded,
              )),
          Expanded(
              flex: 6,
              child: myTextFeild(
                controller: email,
                hint: "Email",
                icon: Icons.email_outlined,
              )),
          Expanded(
              flex: 6,
              child: myTextFeild(
                controller: password,
                hint: "Password",
                icon: Icons.lock_outline,
              )),
          Expanded(
              flex: 6,
              child: myTextFeild(
                controller: rePassword,
                hint: "Re-enter Password",
                icon: Icons.lock_outline,
              )),
          Expanded(
              flex: 4,
              child: Container(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    child: RichText(
                      text: TextSpan(
                          text: "By siginning in you agree to our ",
                          style: h4,
                          children: [
                            TextSpan(
                                text: "terms & condiotions", style: underline)
                          ]),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              width: Get.width * .7,
                              height: MediaQuery.of(context).size.height / 2,
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 10, top: 20),
                                        child: Text(
                                          "By your use of this Platform, Agree to Agree to the Standard Terms and Conditions",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 150),
                                        child: Text(
                                          " 1-Individual property",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "We provide you with the power to use the application and reuse some personal purposes only ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 207),
                                        child: Text(
                                          "2-Limitations ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "In the event that you use this application, you are prohibited from the following ..Using the app illegally ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Remove the logos of copyright,operation, publishing, publishing rights or any other intellectual property logos from the application or intellectual ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 201),
                                        child: Text(
                                          "3-Your privacy ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 86),
                                        child: Text(
                                          "Please read the privacy policy ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Your content should be in me, the crown, your outreach, and the app.",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "It has the power to remove any of your content without notice",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(
                                                  255, 99, 94, 94)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 100,
                                          right: 100,
                                          top: 8,
                                          bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: myButton(
                                        text: 'Close',
                                        backGroundColor: lightGreen,
                                      ))
                                ],
                              )));
                    },
                  ))),
          Expanded(
              flex: 5,
              child: InkWell(
                  onTap: () {
                    print(username!.text.toString());
                    print(email!.text.toString());

                    print(password!.text.toString());

                    print(rePassword!.text.toString());

                    createAccount(
                        email: email!.text,
                        password: password!.text,
                        rePassword: rePassword!.text,
                        username: username!.text);

                    //  Get.to(BNBart());
                  },
                  child: myButton(
                    text: "Sign up",
                    backGroundColor: lightGreen,
                  ))),
          Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                    onTap: () => myController.moveToLogin(),
                    child: Text(
                      "Back to login",
                      style: underline,
                    )),
              )),
          Expanded(flex: 3, child: Container())
        ],
      ),
    );
  }
}
