import 'package:get/get.dart';
import '../controllers/common/auth_controller.dart';
import '../controllers/customer/dashboard_controller.dart';
import '../localization/controller/language_controller.dart';
class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(()=>LanguageController());

  }
}
