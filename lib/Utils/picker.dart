import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Picker {
  static final ImagePicker imagePicker = ImagePicker();
// camera
  static Future<File?> pickImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

// gallery
  static Future<File?> pickImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
