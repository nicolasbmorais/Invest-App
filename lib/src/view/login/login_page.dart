import 'package:auth_service/auth_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/controller/login_controller.dart';
import 'package:shared_components/shared_components.dart';

class LoginPage extends GetResponsiveView<AuthService> {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());
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
              onPressed: () => Get.back(),
              icon: const Icon(Icons.keyboard_arrow_left_rounded),
              iconSize: 30,
            )),
        body: Obx(
          () => _loginController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fazer login',
                          style: TextStyles.title,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 30),
                          child: Text(
                            'Entre com uma conta existente',
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
                                  controller: _loginController.emailController,
                                  validator: _loginController.validateEmail,
                                  text: 'Email',
                                  onChanged: (value) {},
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: InvestAppInput(
                                  controller: _loginController.passwordController,
                                  validator: _loginController.validatePassword,
                                  text: 'Senha',
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: PrimaryButton(
                            label: 'Entrar',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await _loginController.signIn();
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SecondaryButton(
                            label: 'Não tem uma conta?',
                            onPressed: () {
                              Get.toNamed(Routes.createAccountPage);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
