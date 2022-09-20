import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/bindings/login_binding.dart';
import 'package:invest_app/src/bindings/profile_binding.dart';
import 'package:invest_app/src/view/home/home_page.dart';
import 'package:invest_app/src/view/home/notification_page.dart';
import 'package:invest_app/src/view/login/login_page.dart';
import 'package:invest_app/src/view/my_asset/my_asset.dart';
import 'package:invest_app/src/view/profile/contact_info_page.dart';
import 'package:invest_app/src/view/profile/profile_page.dart';
import 'package:invest_app/src/view/signup/create_account.dart';
import 'package:invest_app/src/view/signup/welcome_page.dart';
import 'package:invest_app/src/view/splash_screen/splash_screen.dart';
import 'package:auth_service/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          GetPage(name: Routes.splashScreen, page: () => SplashScreen(), binding: AuthPageBinding()),
          GetPage(name: Routes.welcomePage, page: () => const WelcomePage()),
          GetPage(name: Routes.createAccountPage, page: () => CreateAccountPage(), binding: LoginBinding()),
          GetPage(name: Routes.loginPage, page: () => LoginPage(), binding: LoginBinding()),
          GetPage(name: Routes.homePage, page: () => HomePage(), binding: LoginBinding()),
          GetPage(name: Routes.myAssetPage, page: () => MyAssetPage()),
          GetPage(name: Routes.profilePage, page: () => ProfilePage(), bindings: [AuthPageBinding(), ProfileBinding()]),
          GetPage(name: Routes.contactInfoPage, page: () => ContactInfoPage(), binding: ProfileBinding()),
          GetPage(name: Routes.notificationPage, page: () => NotificationPage()),
        ]);
  }
}
