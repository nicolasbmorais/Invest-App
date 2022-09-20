import 'dart:io';
import 'dart:ui';
import 'package:auth_service/auth_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/controller/profile_controller.dart';
import 'package:shared_components/shared_components.dart';

class ContactInfoPage extends GetResponsiveView {
  ContactInfoPage({Key? key}) : super(key: key);
  final AuthServiceController authServiceController = Get.find<AuthServiceController>();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Text(
          'Informações de contato',
          style: TextStyles.bodyRegularBlack,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onTap: () async {
                    // authServiceController.setProfilePhoto(photoURL)
                    await profileController.pickImage();
                  },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(48),
                            child: Image.file(
                                    File(profileController.auth.currentUser!.photoURL ?? AppImages.profileImage),
                                  )
                               
                          ),
                        ),
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              alignment: Alignment.center,
                              child: const Center(
                                child: Icon(Icons.mode_edit_outline_rounded, color: ColorPalette.white, size: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 8),
                child: Text(authServiceController.auth.currentUser!.displayName!, style: TextStyles.title2),
              ),
              Text('Especialista', style: TextStyles.bodyRegularBlack),
              const SizedBox(height: 20),
              GuideListTile(
                title: 'Nome',
                titleStyle: TextStyles.bodySmallTitleInputBlack,
                subTitle: authServiceController.auth.currentUser!.displayName ?? '',
                subtitleTextColor: TextStyles.bodySmallInputBlack,
                divider: true,
                suffixText: 'Alterar',
                suffixTextColor: TextStyles.bodySmallGreen,
              ),
              GuideListTile(
                title: 'Email',
                titleStyle: TextStyles.bodySmallTitleInputBlack,
                subTitle: authServiceController.auth.currentUser!.email ?? '',
                subtitleTextColor: TextStyles.bodySmallInputBlack,
                divider: true,
                suffixText: 'Alterar',
                suffixTextColor: TextStyles.bodySmallGreen,
              ),
              GuideListTile(
                title: 'Número de telefone',
                titleStyle: TextStyles.bodySmallTitleInputBlack,
                subTitle: authServiceController.auth.currentUser!.phoneNumber ?? 'Adicionar número de telefone',
                subtitleTextColor: TextStyles.bodySmallInputBlack,
                divider: true,
                suffixText: 'Alterar',
                suffixTextColor: TextStyles.bodySmallGreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
