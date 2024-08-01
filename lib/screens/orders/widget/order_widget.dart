import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../../../widgets/widgets.dart';
import '../../../models/customers/cart/cart_model.dart';
import '../../../models/customers/orders/orders_model.dart';
import '../../admin/orders/orders_details.dart';
import '../../cart/widget/cart_widget.dart';

// ================== My Order List =========================
Widget orderCard(
    {required BuildContext context,
      required int index,
      required OrderData model}) {
  return Container(
    decoration: BoxDecoration(
      color: white,
      border: Border.all(
        color: liteBlack,
        width: 1, //                   <--- border width here
      ),

      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    child: Column(
      children: [
        Row(
          children: [
            textWidget(
                text: "Order No. ${model.orderId}",
                fontWeight: FontWeight.bold,
                fontSize: 18),
            Spacer(),
            textWidget(
                text:
                DateFormat('dd MMM, yyyy').format(DateTime.parse((model.deliveryDate.toString()))),
                color: black,
                fontWeight: FontWeight.bold
            ),
          ],
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            textWidget(text: "Quantity:", color: secondary),
            textWidget(
                text: model.totalItems.toString(), fontWeight: FontWeight.bold),
            Spacer(),
            textWidget(text: "Total Amount:", color: secondary),
            textWidget(
                text: "\$${model.totalAmount?.toStringAsFixed(2)}",
                fontWeight: FontWeight.bold),
          ],
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            textOutlinedButton(text: "Details", onPressed: () {
              Get.to(()=>OrdersDetailsScreen(model: model,));
            }),
            const Spacer(),
            textWidget(
              text: "Delivered",
              color: primary,
              fontSize: 16,
            ),
          ],
        ),
      ],
    ).paddingAll(16),
  );
}

// ================== Review Order Product Card =========================
Widget reviewProductCard(
    {required BuildContext context,
      required int index,
      required AddedProducts model}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          networkImage(image: model.productDetails?.thumbnail.toString()??"", borderRadius: 20,height: 100,width: 88,boxFit: BoxFit.cover).paddingOnly(right: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.productDetails?.description.toString()??"",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: titleLargeTextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Obx(
                          () => Text(
                        "\$${(double.parse(model.productDetails?.price.toString()??"1") * double.parse(model. quantity!.value.toString()??"1")).toStringAsFixed(2)} ",
                        style: titleLargeTextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Obx(
                          () => Text(
                        "\$${((double.parse(model.productDetails?.price.toString()??"1") - ((double.parse(model.productDetails?.price.toString()??"1") * double.parse(model.productDetails?.discountPercentage.toString()??"1")) / 100)) * double.parse(model. quantity!.value.toString()??"1")).toStringAsFixed(2)}",
                        style: titleLargeTextStyle(
                          color: Colors.red.shade900,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "You Save: ",
                      style: titleLargeTextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Obx(
                          () => Text(
                        "\$${(((double.parse(model.productDetails?.price.toString()??"1") * double.parse(model.productDetails?.discountPercentage.toString()??"1")) / 100) * double.parse(model. quantity!.value.toString()??"1")).toStringAsFixed(2)} (${model.productDetails?.discountPercentage}%)",
                        style: titleLargeTextStyle(
                          color: Colors.red.shade900,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 2),
              ],
            ),
          )
        ],
      ).paddingOnly(bottom: 10),
      Row(
        children: [
          Obx(() => model. quantity!.value == 1
              ? const SizedBox.shrink()
              : iconBtn(
              icon: Icons.remove,
              onTap: () {
                model. quantity!.value = model. quantity!.value  - 1;
                debugPrint(model. quantity!.value.toString());
              },
              isLeft: true)),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: secondary,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Obx(
                  () => Text(
                model. quantity!.value.toString()??"1",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingSymmetric(horizontal: 20, vertical: 6),
            ),
          ),
          iconBtn(icon: Icons.add, onTap: () {
            model. quantity!.value = model. quantity!.value  + 1;
            debugPrint(model. quantity!.value.toString());
          }, isLeft: false),
        ],
      )
    ],
  ).paddingAll(16);
}
