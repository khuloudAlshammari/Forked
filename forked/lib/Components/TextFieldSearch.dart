import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forked/Constants/styles.dart';
import 'package:forked/Controllers/searchController.dart';
import 'package:forked/Views/search.dart';
import 'package:get/get.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({super.key, this.hint, this.iconImage});
  final hint;
  final iconImage;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: (value){
      //value is entered text after ENTER press
      //you can also call any function here or make setState() to assign value to other variable
      Get.to(searchPage(searchKey: value,))!.then((value) => Get.delete<searchController>());
    },
                      cursorColor: grey,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(iconImage),
                        hintText: hint,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: grey, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: grey, width: 3),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    );
  }
}