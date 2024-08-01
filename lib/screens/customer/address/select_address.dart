import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/controller_const.dart';
import '../../../widgets/widgets.dart';
import 'add_address.dart';
import 'widget/widget_address.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(title: "Select Address"),
      body: backgroundContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reviewOrderAppBar(text: "Select Address", isBack: true,bottomSpace: 16,topSpace: 45).paddingSymmetric(horizontal: 16),

            // commonAppBar(text: "Select Address", isBack: true,bottomSpace: 16,topSpace: 40),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                      onPressed: () {
                        Get.to(() => const AddAddressScreen());
                      },
                      style: ButtonStyle(
                          elevation: WidgetStateProperty.all(3),
                          //Defines Elevation
                          shadowColor: WidgetStateProperty.all(black),
                          backgroundColor:
                               WidgetStatePropertyAll(white),
                          shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                  side:
                                       BorderSide(color: midBlack),
                                  borderRadius: BorderRadius.circular(12)))),
                      child:
                      textWidget(text: "Add New Address",fontSize: 16).paddingSymmetric(horizontal: 6, vertical: 2))
                  .paddingSymmetric(horizontal: 16),
            ),
            Expanded(
              child: Obx(
                () => orderController.selectAddressList.isEmpty
                    ? noListFound(text: "No Address found")
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: orderController.selectAddressList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (orderController.selectedAddress.isNotEmpty) {
                                orderController.selectedAddress.clear();
                                orderController.selectedAddress.add(
                                    orderController.selectAddressList[index]);
                              } else {
                                orderController.selectedAddress.add(
                                    orderController.selectAddressList[index]);
                              }
                            },
                            child: addressCard(
                                context: context,
                                index: index,
                                model:
                                    orderController.selectAddressList[index],length:orderController.selectAddressList.length),
                          );
                        }).paddingSymmetric(horizontal: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

