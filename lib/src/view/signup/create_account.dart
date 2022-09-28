import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/controller/login_controller.dart';
import 'package:shared_components/shared_components.dart';

class CreateAccountPage extends GetResponsiveView {
  CreateAccountPage({Key? key}) : super(key: key);

  final LoginController _loginController = Get.find<LoginController>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
          backgroundColor: ColorPalette.white,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 20,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Crie uma conta',
                style: TextStyles.title,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 30),
                child: Text(
                  'Invista e dobre sua renda agora',
                  style: TextStyles.bodyRegular,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InvestAppInput(
                        controller: _loginController.userNameController,
                        keyboardType: TextInputType.text,
                        validator: _loginController.validateName,
                        text: 'Nome completo',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InvestAppInput(
                        keyboardType: TextInputType.emailAddress,
                        controller: _loginController.emailController,
                        validator: _loginController.validateEmail,
                        text: 'Email',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InvestAppInput(
                        controller: _loginController.passwordController,
                        validator: _loginController.validatePassword,
                        text: 'Senha',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: PrimaryButton(
                  label: 'Criar conta',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await _loginController.createUser();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SecondaryButton(
                  label: 'Já tem uma conta?',
                  onPressed: () {
                    Get.toNamed(Routes.loginPage);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
