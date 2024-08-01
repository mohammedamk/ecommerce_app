import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/controller_const.dart';
import '../../../widgets/widgets.dart';
import 'widget/order_widget.dart';

class AdminOrdersScreen extends StatefulWidget {
  const AdminOrdersScreen({super.key});

  @override
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: backgroundContainer(
          child:
          // ListView(
          //   children: [
          //     commonAppBar(text: "My Orders",isBack: false,bottomSpace: 16,topSpace: 10),
          //     ListView.builder(
          //         shrinkWrap: true,
          //         // itemCount: orderController.myOrdersList.length,
          //         itemCount: 20,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemBuilder: (context, index) {
          //           return orderCard(
          //             // context: context,
          //             // index: index,
          //             // model: orderController.myOrdersList[index]
          //           ).paddingSymmetric(vertical: 3);
          //         }).paddingSymmetric(horizontal: 16),
          //   ],
          // ),

          Obx(
                () => orderController.myOrdersList.isEmpty
                ? Center(child: noListFound(text: "No Orders Found"))
                : ListView(
              children: [
                commonAppBar(text: "My Orders",isBack: false,bottomSpace: 16,topSpace: 10),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderController.myOrdersList.length,
                    // itemCount: 20,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return orderCard(
                          context: context,
                          index: index,
                          model: orderController.myOrdersList[index]
                      ).paddingSymmetric(vertical: 3);
                    }).paddingSymmetric(horizontal: 16),
              ],
            ),
          ),
        ));
  }
}