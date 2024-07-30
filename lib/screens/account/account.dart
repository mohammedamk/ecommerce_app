import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/controller_const.dart';
import '../../../utils/app_utils.dart';
import '../../constants/images.dart';
import '../../widgets/widgets.dart';
import '../orders/my_orders.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void signOut() async {
    // await AuthService().signOut();
    authPreference.clearSharedData();
    // Get.offAll(() => const FrontScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: appBar(title: "My Profile"),
        body: backgroundContainer(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonAppBar(text: "My Profile",isBack: false),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imgPlaceholder,
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ).paddingOnly(bottom: 10),
              ),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Harsh Shambhuwani",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "harshgshambhuwani@gmail.com",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              commonRow(
                  title: "My Orders",
                  subtitle: "Already Have 12 Orders",
                  onTap: () {
                    Get.to(()=>const MyOrdersScreen());
                  }),
              commonRow(
                  title: "str_language".tr,
                  subtitle: "Already Have 12 Orders",
                  onTap: () {
                    showLanguageAlertDialog(context, () {
                      Navigator.pop(context);
                    });
                  }),
              commonRow(
                  title: "Shipping Address",
                  subtitle: "3 Addresses",
                  onTap: () {
                    // Get.to(()=>SelectAddressScreen());
                  }),
              commonRow(
                  title: "Payment Methods", subtitle: "Visa **34", onTap: () {}),
              commonRow(
                  title: "Promocodes",
                  subtitle: "you have special promocodes",
                  onTap: () {}),
              commonRow(
                  title: "My Reviews",
                  subtitle: "Already Have 12 Orders",
                  onTap: () {}),
              commonRow(
                  title: "Settings",
                  subtitle: "Notifications, password, Logout",
                  onTap: () {}),
              commonRow(
                  title: "Logout", subtitle: "Come back soon", onTap: signOut),
              // const Divider(),
            ],
          )).paddingOnly(left: 16, right: 16),
        ));
  }
}

Widget commonRow(
    {required String title,
    required String subtitle,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        const Divider(),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ).paddingSymmetric(vertical: 4),
      ],
    ),
  );
}
