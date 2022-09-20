import 'package:auth_service/auth_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetResponsiveView<AuthServiceController> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.currentUser(context);
    return Scaffold(
      body: Container(
        color: ColorPalette.white,
        child: Center(
          child: SizedBox(width: 139, height: 92, child: Image.asset(AppImages.splashImage)),
        ),
      ),
    );
  }
}
