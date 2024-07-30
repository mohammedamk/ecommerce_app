import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';
import '../../../models/customers/orders/orders_model.dart';
import '../../../widgets/widgets.dart';
import '../../constants/controller_const.dart';
import 'widget/order_widget.dart';

class OrdersDetailsScreen extends StatefulWidget {
  // final OrderData model;
  const OrdersDetailsScreen({
    super.key,
    // required this.model
  });

  @override
  State<OrdersDetailsScreen> createState() => _OrdersDetailsScreenState();
}

class _OrdersDetailsScreenState extends State<OrdersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // var model = widget.model;
    // String shippingAddress ='${orderController.selectedAddress[0].address},  ${orderController.selectedAddress[0].city}, ${orderController.selectedAddress[0].state}, ${orderController.selectedAddress[0].country}, ${orderController.selectedAddress[0].pincode}, phone number: ${orderController.selectedAddress[0].mobileNo}';
    // String shippingAddress ='${model.customerAddress}, ${model.city}, ${model.state}, ${model.country}-${model.pincode}, phone number: ${model.mobileNo}';
    String shippingAddress =
        "Plot No. 466, Sindhi Colony Khamla, Nagpur-440025, +917756988822";
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: textWidget(text: "View Order Details",fontSize: 20,fontWeight: FontWeight.w500),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // commonAppBar(
              //     text: "View Order Details",
              //     isBack: true,
              //     bottomSpace: 16,
              //     topSpace: 0),
              textWidget(
                      text: "Order Details",
                      fontWeight: FontWeight.bold,
                      fontSize: 20)
                  .paddingOnly(top: 16),
              Container(
                width: double.infinity,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(text: "Order date", fontSize: 16),
                        textWidget(
                            text: "16 Nov, 2023",
                            // DateFormat('dd MMM, yyyy').format(
                            //     DateTime.parse((model.createdAt.toString()))),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(text: "Order #", fontSize: 16),
                        textWidget(
                            text: "1234423",
                            // "${model.orderId}",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ],
                    ).paddingSymmetric(vertical: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                            text: "Order total",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        textWidget(
                            text: "\$3000 (4 items)",
                                // "\$${model.totalAmount} (${model.totalItems} items)",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ],
                    ).paddingOnly(bottom: 10),
                    InkWell(
                      onTap: () {
                        updateOrderStatusDialog("productName", () {
                          // model.setOrderStatus = "Approve";

                          // orderController.updateOrderStatusApi(orderId: int.parse(model.orderId.toString()), orderStatus: model.orderStatus.toString());
                          // setState(() {
                          // });
                        }, () {
                          // model.setOrderStatus = "Cancel";
                          Get.back();
                          // orderController.updateOrderStatusApi(orderId: int.parse(model.orderId.toString()), orderStatus: model.orderStatus.toString());
                          //
                          // setState(() {
                          // });
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textWidget(
                              text: "Order Status",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: primary),
                          textWidget(
                              text: "Delivered",
                              // model.orderStatus.toString(),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: primary),
                        ],
                      ),
                    ),
                  ],
                ).paddingAll(16),
              ).paddingSymmetric(vertical: 16),
              textWidget(
                  text: "Shipping Details",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              Container(
                width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        textWidget(text: "Standard Delivery "),
                      ],
                    ).paddingAll(16),
                    const Divider(),
                    ListView.builder(
                      itemCount: 4,
                      // model.orderedProducts!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return orderDetailsCard(
                            // context: context,
                            // index: index,
                            // model: model.orderedProducts![index]
                        );
                      },
                    ),
                  ],
                ),
              ).paddingSymmetric(vertical: 16),
              textWidget(
                  text: "Payment Information",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              Container(
                width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                        text: "Payment methods",
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    textWidget(text: "Visa ending in 1094", fontSize: 16),
                    Divider(),
                    textWidget(
                        text: "Billing Address",
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    textWidget(
                      text: shippingAddress,
                    ),
                  ],
                ).paddingAll(16),
              ).paddingSymmetric(vertical: 16),
              textWidget(
                  text: "Shipping Address",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              Container(
                width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      text: "Harsh Shambhuwani",
                    ),
                    textWidget(text: shippingAddress),
                  ],
                ).paddingAll(16),
              ).paddingSymmetric(vertical: 16),
              textWidget(
                  text: "Order Summary",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              Container(
                width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                            // text: 'Items (${cartController.totalItems}): ')),
                            text:
                            'Items (4): '),
                            // 'Items (${model.totalItems}): '),
                        textWidget(
                          // text: "\$${cartController.totalAmount.toStringAsFixed(2)}",
                          text: "\$3000",
                          // "\$${model.totalAmount}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(text: 'Delivery: '),
                        textWidget(
                          text: "\$00.00",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          text: "Order Total: ",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textWidget(
                            // text: "\$${cartController.totalAmount.toStringAsFixed(2)}",
                            text: "\$3000",
                            // "\$${model.totalAmount}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primary),
                      ],
                    ).paddingSymmetric(vertical: 12),
                    const Divider(),
                    textWidget(
                      text: "Your Savings: \$10",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      color: primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ).paddingOnly(left: 16),
                    textWidget(
                      text: "• Item discount",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ).paddingAll(16),
              ).paddingSymmetric(vertical: 16),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
