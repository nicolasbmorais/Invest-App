import 'package:auth_service/auth_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  RxString imageData = ''.obs;

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
    await AuthService.to.user.updatePhotoURL(photoURL);
    update();
  }
}
