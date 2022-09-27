import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:invest_app/src/view/home/home_page.dart';
import 'package:invest_app/src/view/my_asset/my_asset.dart';
import 'package:invest_app/src/view/profile/profile_page.dart';

class HomePageController extends GetxController {
  // RxInt currentPage = 0.obs;

  RxInt currentIndex = 0.obs;

  final List<Widget> children = [
    HomePage(),
    MyAssetPage(),
    ProfilePage(),
  ].obs;

  void onTabTapped(int index) {
    currentIndex.value = index;
    update();
  }

  // void changeCard(int value){
  //   currentPage.value = value;
  //   update();
  // }
}
