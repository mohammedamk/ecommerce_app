import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/controller_const.dart';
import '../../../constants/images.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/widgets.dart';
import '../../authorization/front.dart';
import '../../orders/my_orders.dart';

class AdminAccountScreen extends StatefulWidget {
  const AdminAccountScreen({super.key});

  @override
  State<AdminAccountScreen> createState() => _AdminAccountScreenState();
}

class _AdminAccountScreenState extends State<AdminAccountScreen> {
  void signOut() async {
    // await AuthService().signOut();
    authPreference.clearSharedData();
    Get.offAll(() => const FrontScreen());
  }

  @override
  void initState() {
    // TODO: implement initState

    logger.d(adminDashboardController.admin.value.profilePic);
    super.initState();
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
                      child: Image.network(
                        adminDashboardController.admin.value.profilePic??"",
                        height: 120,
                        width: 120,
                        fit: BoxFit.fill,
                        errorBuilder:
                            (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return  Image.asset(imgPlaceholder,
                            height: 120,
                            width: 120,
                            fit: BoxFit.fill);
                        },
                      ),
                    ).paddingOnly(bottom: 10),
                  ),
                   Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          adminDashboardController.admin.value.fullName??"",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          adminDashboardController.admin.value.email??"",
                          style: const TextStyle(fontSize: 14),
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
