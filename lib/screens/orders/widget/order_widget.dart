import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../../../widgets/widgets.dart';
import '../../../models/customers/cart/cart_model.dart';
import '../../../models/customers/orders/orders_model.dart';
import '../../cart/widget/cart_widget.dart';
import '../orders_details.dart';

// ================== My Order List =========================
Widget orderCard(
    // {required BuildContext context,
    // required int index,
    // required OrderData model}
    ) {
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
                text: "#12234422",
                // "Order No. ${model.orderId}",
                fontWeight: FontWeight.bold,
                fontSize: 18),
            Spacer(),
            textWidget(
                text: "30 Jul, 2024",
                // DateFormat('dd MMM, yyyy').format(DateTime.parse((model.deliveryDate.toString()))),
                color: black,
                fontWeight: FontWeight.bold),
          ],
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            textWidget(text: "Quantity:", color: secondary),
            textWidget(
                text: "4",
                // model.totalItems.toString(),
                fontWeight: FontWeight.bold),
            const Spacer(),
            textWidget(text: "Total Amount:", color: secondary),
            textWidget(
                text: "\$ 3000",
                // "\$${model.totalAmount?.toStringAsFixed(2)}",
                fontWeight: FontWeight.bold),
          ],
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            textOutlinedButton(
                text: "Details",
                onPressed: () {
                  Get.to(() => const OrdersDetailsScreen(
                        // model: model,
                      ));
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

void updateOrderStatusDialog(
    String productName, Function onApprove, Function onCancel) {
  Get.defaultDialog(
    contentPadding: EdgeInsets.all(16),
    title: 'Update Order Status',
    middleText: 'Are you want to Approve the order or cancel it',
    textConfirm: 'Approve Order',
    textCancel: 'Cancel Order',
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.black,
    buttonColor: Colors.red,
    onConfirm: () {
      onApprove();
      Get.back(); // Close the dialog
    },
    onCancel: () {
      onCancel();
    },
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
          networkImage(
                  image: model.productDetails?.thumbnail.toString() ?? "",
                  borderRadius: 20,
                  height: 100,
                  width: 88,
                  boxFit: BoxFit.cover)
              .paddingOnly(right: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.productDetails?.description.toString() ?? "",
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
                        "\$${(double.parse(model.productDetails?.price.toString() ?? "1") * double.parse(model.quantity!.value.toString() ?? "1")).toStringAsFixed(2)} ",
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
                        "\$${((double.parse(model.productDetails?.price.toString() ?? "1") - ((double.parse(model.productDetails?.price.toString() ?? "1") * double.parse(model.productDetails?.discountPercentage.toString() ?? "1")) / 100)) * double.parse(model.quantity!.value.toString() ?? "1")).toStringAsFixed(2)}",
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
                        "\$${(((double.parse(model.productDetails?.price.toString() ?? "1") * double.parse(model.productDetails?.discountPercentage.toString() ?? "1")) / 100) * double.parse(model.quantity!.value.toString() ?? "1")).toStringAsFixed(2)} (${model.productDetails?.discountPercentage}%)",
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
          Obx(() => model.quantity!.value == 1
              ? const SizedBox.shrink()
              : iconBtn(
                  icon: Icons.remove,
                  onTap: () {
                    model.quantity!.value = model.quantity!.value - 1;
                    debugPrint(model.quantity!.value.toString());
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
                model.quantity!.value.toString() ?? "1",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingSymmetric(horizontal: 20, vertical: 6),
            ),
          ),
          iconBtn(
              icon: Icons.add,
              onTap: () {
                model.quantity!.value = model.quantity!.value + 1;
                debugPrint(model.quantity!.value.toString());
              },
              isLeft: false),
        ],
      )
    ],
  ).paddingAll(16);
}

// ======================= Order Details Card ============================

Widget orderDetailsCard(
    // {
    //   required BuildContext context,
    // required int index,
    // required OrderedProducts model
    // }
    ) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          networkImage(
                  image: "",
                  // model.productDetails?.thumbnail.toString() ?? "",
                  borderRadius: 20,
                  height: 100,
                  width: 88,
                  boxFit: BoxFit.cover)
              .paddingOnly(right: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  // model.productDetails?.description.toString() ?? "",
                  " faefg houf aweofugepa faupiefh uefpiueh fiupehfpuih iuhpa ufhpauifhp ",
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
                    Text(
                      "\$4000",
                      // "\$${(double.parse(model.productDetails?.price.toString() ?? "1") * double.parse(model.quantity.toString())).toStringAsFixed(2)} ",
                      style: titleLargeTextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      // "\$${((double.parse(model.productDetails?.price.toString() ?? "1") - ((double.parse(model.productDetails?.price.toString() ?? "1") * double.parse(model.productDetails?.discountPercentage.toString() ?? "1")) / 100)) * double.parse(model.quantity.toString())).toStringAsFixed(2)}",
                      "\$300",
                      style: titleLargeTextStyle(
                        color: Colors.red.shade900,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
                    Text(
                      "\$10",
                      // "\$${(((double.parse(model.productDetails?.price.toString() ?? "1") * double.parse(model.productDetails?.discountPercentage.toString() ?? "1")) / 100) * double.parse(model.quantity!.toString() ?? "1")).toStringAsFixed(2)} (${model.productDetails?.discountPercentage ?? "1"}%)",
                      style: titleLargeTextStyle(
                        color: Colors.red.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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
          // Obx(() => model.quantity!.value == 1
          //     ? const SizedBox.shrink()
          //     : iconBtn(
          //     icon: Icons.remove,
          //     onTap: () {
          //       model.quantity!.value = model.quantity!.value - 1;
          //       debugPrint(model.quantity!.value.toString());
          //     },
          //     isLeft: true)),
          textWidget(
              text: "Quantity: ", fontSize: 18, fontWeight: FontWeight.bold),
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
            child: textWidget(
              text:
              "4",
              // model.quantity.toString(),
              fontWeight: FontWeight.w600,
            ).paddingSymmetric(horizontal: 20, vertical: 6),
          ),
        ],
      )
    ],
  ).paddingAll(16);
}
