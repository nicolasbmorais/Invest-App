import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final RxBool hidePassword = true.obs;

  RxString get firstName => auth.currentUser!.displayName!.split(' ')[0].obs;
  RxString get fullName => auth.currentUser!.displayName!.obs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      user = auth.currentUser;
      Get.offNamed(Routes.homePage);
      update();
    } on FirebaseAuthException catch (e, s) {
      _handleLoginException(e, s);
      update();
    } catch (e) {
      CustomAlert.showGenericError();
      update();
    }
  }

  Future<void> register({required String email, required String password, required String name}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      user = auth.currentUser;
      await user!.updateDisplayName(name);
      Get.offNamed(Routes.homePage);
      update();
    } on FirebaseAuthException catch (e, s) {
      _handleRegisterException(e, s);
      update();
    }
  }

  void _handleLoginException(FirebaseAuthException e, StackTrace s) {
    if (e.code == 'user-not-found') {
      CustomAlert.show(
        title: 'Usuário não encontrado',
        message: 'Nenhum usuário encontrado para esse e-mail.',
      );
    } else if (e.code == 'invalid-email') {
      CustomAlert.show(
        title: 'Email inválido',
        message: 'O email inserido é inválido.',
      );
    } else if (e.code == 'wrong-password') {
      CustomAlert.show(
        title: 'Senha inválida',
        message: 'Senha incorreta para esse usuário.',
      );
    } else {
      CustomAlert.showGenericError();
    }
  }

  void _handleRegisterException(FirebaseAuthException e, StackTrace s) {
    if (e.code == 'weak-password') {
      CustomAlert.show(
        title: 'Senha fraca',
        message: 'A senha fornecida é muito fraca.',
      );
    } else if (e.code == 'email-already-in-use') {
      CustomAlert.show(
        title: 'Email já em uso',
        message: 'A conta já existe para esse e-mail.',
      );
    } else {
      CustomAlert.showGenericError();
    }
  }

  void logout() async {
    await auth.signOut();
    await Get.offAllNamed(Routes.loginPage);
    update();
  }
}
