import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/controller_const.dart';
import '../../../widgets/widgets.dart';
import '../../dashboard/dashboard.dart';
import 'widget/widget_address.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: backgroundContainer(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reviewOrderAppBar(text: "Enter a new address", isBack: true,bottomSpace: 16,topSpace: 0,onTap: (){
                  orderController.clearController();
                  Get.offAll(()=>const DashBoardScreen(currentIndex: 3));

                }),
                textWidget(
                        text: "Full Name (First and Last name)",
                        fontWeight: FontWeight.w600)
                    .paddingSymmetric(vertical: 10),
                dimensionTextTile(
                    hintText: "Enter Full Name",
                    keyboardType: TextInputType.name,
                    controller: orderController.fullNameController),
                textWidget(text: "Mobile Number", fontWeight: FontWeight.w600)
                    .paddingSymmetric(vertical: 10),
                dimensionTextTile(
                    hintText: "Enter Mobile Number",
                    keyboardType: TextInputType.number,
                    controller: orderController.mobileNumberController),
                textWidget(
                        text: "Flat, House no. Building, Company, Apartment",
                        fontWeight: FontWeight.w600)
                    .paddingSymmetric(vertical: 10),
                dimensionTextTile(
                    hintText: 'Enter Plot No. ',
                    keyboardType: TextInputType.streetAddress,
                    controller: orderController.houseNumberController),
                textWidget(
                        text: "Area, Street, Sector, Village",
                        fontWeight: FontWeight.w600)
                    .paddingSymmetric(vertical: 10),
                dimensionTextTile(
                    hintText: 'Enter Area, Street',
                    keyboardType: TextInputType.streetAddress,
                    controller: orderController.areaController),
                textWidget(text: "Landmark", fontWeight: FontWeight.w600)
                    .paddingSymmetric(vertical: 10),
                dimensionTextTile(
                    hintText: 'E.g. near apollo hospital',
                    keyboardType: TextInputType.streetAddress,
                    controller: orderController.landmarkController),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: columnCard(
                              text: "Pincode",
                              hintText: '6-digit Pincode',
                              keyboardType: TextInputType.number,
                              controller: orderController.pincodeController)
                          .paddingOnly(right: 8),
                    ),
                    Expanded(
                        child: columnCard(
                            text: "Town/City",
                            hintText: 'E.g. Nagpur',
                            keyboardType: TextInputType.name,
                            controller: orderController.cityController)),
                  ],
                ),
                textWidget(text: "State", fontWeight: FontWeight.w600)
                    .paddingSymmetric(vertical: 10),
                dimensionTextTile(
                    hintText: 'E.g. Maharashtra',
                    keyboardType: TextInputType.name,
                    controller: orderController.stateController),
                filledButton(
                        height: 45,
                        onPressed: orderController.addAddressButton,
                        text: "Use this address",
                        textColor: white,
                        colorButton: primary)
                    .paddingSymmetric(vertical: 16)
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
