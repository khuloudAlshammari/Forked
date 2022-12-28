


import 'package:image_picker/image_picker.dart';

funcGetImageFromGallery() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  return image?.path;
}
//طريقة استدعاء الميثود
//var image = await funcGetImageFromGallery();