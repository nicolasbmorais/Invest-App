import 'package:auth_service/src/controller/auth_service_controller.dart';
import 'package:common/common.dart';

class AuthPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthServiceController>(() => AuthServiceController());
  }
}
