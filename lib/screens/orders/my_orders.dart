import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/controller_const.dart';
import '../../widgets/widgets.dart';
import 'widget/order_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: textWidget(
      //       text: "My Orders", fontSize: 20, fontWeight: FontWeight.bold),
      //   centerTitle: true,
      // ),
        body: backgroundContainer(
          child: Obx(
                () => orderController.myOrdersList.isEmpty
                ? Center(child: noListFound(text: "No Orders Found"))
                : RefreshIndicator(
              onRefresh: ()async {
                return await orderController.orderListApi();
              },
              child: ListView(
                children: [
                  commonAppBar(text: "My Orders",isBack: false,bottomSpace: 16,topSpace: 10),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: orderController.myOrdersList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return orderCard(
                            context: context,
                            index: index,
                            model: orderController.myOrdersList[index])
                            .paddingSymmetric(vertical: 3);
                      }).paddingSymmetric(horizontal: 16),
                ],
              ),
            ),
          ),
        ));
  }
}