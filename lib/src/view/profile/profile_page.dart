import 'dart:io';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/controller/login_controller.dart';
import 'package:invest_app/src/controller/profile_controller.dart';
import 'package:shared_components/shared_components.dart';

class ProfilePage extends GetResponsiveView {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find<ProfileController>();
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black, size: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(children: [Text('Perfil', style: TextStyles.title)]),
              Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48),
                        child: Image.file(
                          File(profileController.auth.currentUser!.photoURL ?? AppImages.profileImage),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: Text(_loginController.fullName.value, style: TextStyles.title2),
                  ),
                  Text('Especialista', style: TextStyles.bodyRegularBlack),
                  const SizedBox(height: 20),
                  ProfileListTile(
                    icon: Icons.contact_page_sharp,
                    title: 'Informações de contato',
                    onTap: () => Get.toNamed(Routes.contactInfoPage),
                  ),
                  ProfileListTile(
                    icon: Icons.food_bank,
                    title: 'Informações bancárias',
                    onTap: () => Get.toNamed('page'),
                  ),
                  ProfileListTile(
                      icon: Icons.settings,
                      title: 'Sair',
                      onTap: () async {
                        await profileController.pickImage();
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
