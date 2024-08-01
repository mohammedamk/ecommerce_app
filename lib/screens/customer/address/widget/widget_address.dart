

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/controller_const.dart';
import '../../../../models/customers/address_model.dart';
import '../../../../widgets/widgets.dart';
import '../../../orders/review_order.dart';

Widget columnCard(
    {required String text,
      required String hintText,
      required TextInputType keyboardType,
      required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textWidget(text: text, fontWeight: FontWeight.w600)
          .paddingSymmetric(vertical: 10),
      dimensionTextTile(
          hintText: hintText,
          keyboardType: keyboardType,
          controller: controller),
    ],
  );
}

Widget addressCard(
    {required BuildContext context,
      required int index,
      required AllAddress model, required int length}) {
  return Container(
    decoration: BoxDecoration(
      color: white,
      border: Border.all(
        color: liteBlack,
        width: 1, //                   <--- border width here
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(index == 0 ? 8 : 0),
        topRight: Radius.circular(index == 0 ? 8 : 0),
        bottomLeft: Radius.circular(index == length ? 8 : 0),
        bottomRight: Radius.circular(index == length ? 8 : 0),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(
                  () => model.id == orderController.selectedAddress[0].id
                  ? CircleAvatar(
                radius: 10,
                backgroundColor: primary,
              ).paddingSymmetric(horizontal: 16)
                  : Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                      color: secondary,
                      width:
                      1, //                   <--- border width here
                    ),
                    borderRadius: BorderRadius.circular(50)),
              ).paddingSymmetric(horizontal: 16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(text: model.fullName.toString(), fontWeight: FontWeight.w600),
                textWidget(text: model.address.toString()),
                textWidget(text: '${model.city}, ${model.state}, ${model.pincode}'),
                textWidget(text: model.country.toString()),
                textWidget(text: 'Phone number: ${model.mobileNo}'),
              ],
            ),
          ],
        ).paddingOnly(top: 10, bottom: 12),
        Obx(
              () => model.id == orderController.selectedAddress[0].id
              ? Column(
            children: [
              filledButton(height: 45, onPressed: () {
                Get.to(() => const ReviewOrderScreen());
              }, text: "Deliver to this address", textColor: white, colorButton: primary).paddingSymmetric(
                horizontal: 20,
              ),
              SizedBox(
                height: 36,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      elevation: WidgetStateProperty.all(3),
                      //Defines Elevation
                      shadowColor: WidgetStateProperty.all(black),
                      backgroundColor:
                      WidgetStatePropertyAll(white),
                      shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              side:  BorderSide(
                                  color: midBlack),
                              borderRadius:
                              BorderRadius.circular(10)))),
                  child:
                  textWidget(text: "Edit Address",fontSize: 16),),
              ).paddingSymmetric(horizontal: 20, vertical: 16),
            ],
          )
              : const SizedBox(
            height: 20,
          ),
        )
      ],
    ),
  );
}