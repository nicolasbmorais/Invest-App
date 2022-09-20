import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  RxString imageData = ''.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  Future<void> pickImage() async {
    try {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file != null) {
        imageData.value = file.path;
        setProfilePhoto(imageData.value);
        update();
      }
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setProfilePhoto(String photoURL) async {
    await auth.currentUser!.updatePhotoURL(photoURL);
    update();
  }
}
