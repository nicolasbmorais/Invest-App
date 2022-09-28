import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/config.dart';
import 'package:invest_app/src/view/home/home_page.dart';
import 'package:invest_app/src/view/home/initial_page.dart';
import 'package:invest_app/src/view/home/notification_page.dart';
import 'package:invest_app/src/view/login/login_page.dart';
import 'package:invest_app/src/view/my_asset/my_asset.dart';
import 'package:invest_app/src/view/profile/contact_info_page.dart';
import 'package:invest_app/src/view/profile/profile_page.dart';
import 'package:invest_app/src/view/signup/create_account.dart';
import 'package:invest_app/src/view/signup/welcome_page.dart';
import 'package:invest_app/src/view/splash_screen/splash_screen.dart';

void main() async {
  await initConfigurations();
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Invest App',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        theme: ThemeData(
          // scaffoldBackgroundColor: ColorPalette.primarypsi300,
          primarySwatch: Colors.blue,
        ),
        getPages: [
          GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
          GetPage(name: Routes.welcomePage, page: () => const WelcomePage()),
          GetPage(name: Routes.createAccountPage, page: () => CreateAccountPage()),
          GetPage(name: Routes.loginPage, page: () => LoginPage()),
          GetPage(name: Routes.homePage, page: () => HomePage()),
          GetPage(name: Routes.initialPage, page: () => InitialPage()),
          GetPage(name: Routes.myAssetPage, page: () => MyAssetPage()),
          GetPage(name: Routes.profilePage, page: () => ProfilePage()),
          GetPage(name: Routes.contactInfoPage, page: () => ContactInfoPage()),
          GetPage(name: Routes.notificationPage, page: () => NotificationPage()),
        ]);
  }
}
