
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';


import 'package:image_picker/image_picker.dart';

funcGetImageFromGallery() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  return image?.path;
}
//طريقة استدعاء الميثود
//var image = await funcGetImageFromGallery();






Future<String> uploadTofieStorage({required String path, required String identifier})async{
  String url="";
  var ref = FirebaseStorage.instance.ref();
  var myImagePath=ref.child("AllImages/${identifier}.png");

  UploadTask myUpload =myImagePath.putFile(File(path));
 await myUpload.whenComplete(()async {
    url= await myUpload.snapshot.ref.getDownloadURL();
   
  //  print(await myUpload.snapshot.ref.getDownloadURL());
 });

 return url;
}


Future<String> openAndUploadPic({required String identifier})async{

 String imagePath= await funcGetImageFromGallery();
String url= await uploadTofieStorage(path: imagePath, identifier: identifier);
return url;
}