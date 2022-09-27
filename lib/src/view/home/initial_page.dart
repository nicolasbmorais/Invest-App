// ignore_for_file: unnecessary_const

import 'package:auth_service/auth_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/controller/home_page_controller.dart';

class InitialPage extends GetResponsiveView<AuthService> {
  InitialPage({Key? key}) : super(key: key);
  final HomePageController _homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Obx(() => _homeController.children[_homeController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: ColorPalette.white,
          onTap: _homeController.onTabTapped,
          currentIndex: _homeController.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_filled,
                color: ColorPalette.primaryButton,
              ),
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.looks_two,
                color: ColorPalette.primaryButton,
              ),
              icon: Icon(
                Icons.looks_two,
              ),
              label: 'Transações',
              backgroundColor: ColorPalette.grey,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: ColorPalette.primaryButton,
              ),
              icon: Icon(Icons.person),
              label: 'Conta',
            ),
          ],
        ),
      ),
    );
  }
}
