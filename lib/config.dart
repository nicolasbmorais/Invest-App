import 'package:auth_service/auth_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/controller/home_page_controller.dart';
import 'package:invest_app/src/controller/login_controller.dart';
import 'package:invest_app/src/controller/profile_controller.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase
  await Firebase.initializeApp();

  // GetX Bindings

  // Get.lazyPut<ThemeController>(() => ThemeController());
  Get.lazyPut<AuthService>(() => AuthService());
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<ProfileController>(() => ProfileController());
  Get.lazyPut<HomePageController>(() => HomePageController());
}
