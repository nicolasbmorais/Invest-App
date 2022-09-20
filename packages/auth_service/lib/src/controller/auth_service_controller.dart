import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';

class AuthServiceController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  Future<void> currentUser(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    if (auth.currentUser != null) {
      Get.offAllNamed(Routes.homePage);
    } else {
      Get.offAllNamed(Routes.welcomePage);
    }
    return;
  }
}
