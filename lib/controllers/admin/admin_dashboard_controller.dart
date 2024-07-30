
import 'package:get/get.dart';

import '../../../models/admin/auth/admin_user_model.dart';

class AdminDashboardController extends GetxController{
  static AdminDashboardController instance = Get.find();

  Rx<bool> loading = false.obs;
  var versionName = ''.obs;
  Rx<int> selectedIndex = 0.obs;
  var admin = AdminData().obs;


  void onItemTapped(int index) {
    selectedIndex(index);
  }


}