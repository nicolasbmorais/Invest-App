import 'package:common/common.dart';

class HomePageController extends GetxController{
  RxInt currentPage = 0.obs;

  void changeCard(int value){
    currentPage.value = value;
    update();
  }
}