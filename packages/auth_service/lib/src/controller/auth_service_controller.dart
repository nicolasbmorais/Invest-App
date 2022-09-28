import 'package:common/common.dart';
import 'package:shared_components/shared_components.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();
  var userIsAuthenticated = false.obs;

  User get user => _auth.currentUser!;
  static AuthService get to => Get.put(AuthService());

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());

    ever(_firebaseUser, (User? user) {
      if (user != null) {
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  Future<void> currentUser() async {
    await Future.delayed(const Duration(seconds: 2));
    userIsAuthenticated.value ? Get.offAllNamed(Routes.initialPage) : Get.offAllNamed(Routes.welcomePage);
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Get.offNamed(Routes.homePage);
      update();
    } on FirebaseAuthException catch (e, s) {
      _handleLoginException(e, s);
      update();
    } catch (e) {
      CustomAlert.showGenericError();
      update();
    }
  }

  Future<void> createUser(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await user.updateDisplayName(name);
      Get.offNamed(Routes.homePage);
      update();
    } on FirebaseAuthException catch (e, s) {
      _handleRegisterException(e, s);
      update();
    }
  }

  void logout() async {
    await _auth.signOut();
    await Get.offAllNamed(Routes.loginPage);
    update();
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
}
