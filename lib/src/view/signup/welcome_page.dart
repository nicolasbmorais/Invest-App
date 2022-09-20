import 'package:common/common.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    width: 300,
                    height: 273,
                    child: Image.asset(AppImages.signupImage, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 16),
                  child: Text(
                    'Fique por dentro de suas finanças conosco.',
                    textAlign: TextAlign.center,
                    style: TextStyles.title,
                  ),
                ),
                Text(
                  'Somos seus novos consultores financeiros para recomendar os melhores investimentos para você.',
                  textAlign: TextAlign.center,
                  style: TextStyles.bodyRegular,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                    label: 'Criar conta',
                    onPressed: () async{
                    await  Get.toNamed(Routes.createAccountPage);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SecondaryButton(
                    label: 'Login',
                    onPressed: () {
                      Get.toNamed(Routes.loginPage);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
