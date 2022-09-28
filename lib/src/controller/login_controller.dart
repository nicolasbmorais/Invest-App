import 'package:auth_service/auth_service.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  RxString get firstName => AuthService.to.user.displayName!.split(' ')[0].obs;
  RxString get fullName => AuthService.to.user.displayName!.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  String? validateName(String? value) => value!.isEmpty ? 'O nome não pode ser vazio' : null;

  String? validateEmail(String? value) => value!.isEmpty
      ? 'Insira um email'
      : !GetUtils.isEmail(value)
          ? 'Insira um email válido'
          : null;

  String? validatePassword(String? value) => value!.isEmpty
      ? 'Insira a senha com'
      : value.length < 6
          ? 'A senha deve ser maior que 6 caracteres'
          : null;

  Future<void> signIn() async {
    isLoading.value = true;
    await AuthService.to.signIn(emailController.text, passwordController.text);
    isLoading.value = false;
  }

  Future<void> createUser() async {
    isLoading.value = true;
    await AuthService.to.createUser(emailController.text, passwordController.text, userNameController.text);
    isLoading.value = false;
  }
}
