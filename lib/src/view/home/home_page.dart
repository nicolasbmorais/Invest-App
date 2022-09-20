import 'package:auth_service/auth_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/controller/login_controller.dart';
import 'package:shared_components/shared_components.dart';

class HomePage extends GetResponsiveView<AuthServiceController> {
  HomePage({Key? key}) : super(key: key);
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.profilePage),
          icon: const Icon(Icons.menu, color: Colors.black, size: 25),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.notificationPage),
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.black, size: 25),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bem vindo, ${_loginController.firstName}',
                style: TextStyles.title,
              ),
            ),
            Center(
              child: CardWidget(
                title: 'Seu portifólio de ativos',
                textValue: 'N203,935',
                textButton: 'Investir agora',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Melhores planos',
                    style: TextStyles.titleBold,
                  ),
                  GestureDetector(
                      child: SizedBox(
                        child: Row(
                          children: [
                            Text(
                              'Ver todos',
                              style: TextStyles.bodyRed,
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.arrow_forward_outlined, size: 18, color: Colors.red),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.toNamed(Routes.myAssetPage);
                      }),
                ],
              ),
            ),
            CarrouselWidget(),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Guia de investimento',
                    style: TextStyles.bodyRegularBlack,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  GuideListTile(
                    title: 'Tipo básico de investimentos',
                    subTitle: 'É assim que você prepara o pé para a recessão do mercado de ações em 2022. Qual é o próximo investimento ?',
                    suffixImage: Image.asset(AppImages.ellipse),
                    divider: false,
                    hasImage: true,
                  ),
                  const Divider(color: ColorPalette.grey, height: 3),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GuideListTile(
                      title: 'Com quanto você pode começar investindo',
                      subTitle: 'O que você gosta de ver? É um mercado muito diferente de 2018.',
                      suffixImage: Image.asset(AppImages.ellipse2),
                      divider: false,
                    hasImage: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
