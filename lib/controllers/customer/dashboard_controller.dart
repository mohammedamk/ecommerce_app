import 'package:get/get.dart';

import '../../../models/customers/auth/customer_user_model.dart';

class DashboardController extends GetxController{
  static DashboardController instance = Get.find();

  Rx<bool> loading = false.obs;
  var versionName = ''.obs;
  Rx<int> selectedIndex = 0.obs;
  CustomerData customer = CustomerData();



  void onItemTapped(int index) {
    selectedIndex(index);
  }


}