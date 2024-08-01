import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../constants/controller_const.dart';
import '../../widgets/widgets.dart';
import 'widget/order_widget.dart';

class ReviewOrderScreen extends StatefulWidget {
  const ReviewOrderScreen({super.key});

  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    String shippingAddress =
        '${orderController.selectedAddress[0].address},  ${orderController.selectedAddress[0].city}, ${orderController.selectedAddress[0].state}, ${orderController.selectedAddress[0].country}, ${orderController.selectedAddress[0].pincode}, phone number: ${orderController.selectedAddress[0].mobileNo}';
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        decoration:  const BoxDecoration(

            image:  DecorationImage(
                image: AssetImage("assets/images/3dbg.jpg"),
                fit: BoxFit.cover,
                opacity: 0.4)),
        child:
        filledButton(height: 45, onPressed: () async {
          await orderController.addOrderApi();
          // int roundOff = double.parse(
          //     cartController.totalAmount.toStringAsFixed(2))
          //     .round();
          // await makePayment(
          //   amount: roundOff.toString(),
          //   currency: "USD",
          // );
        }, text: "Place your order", textColor: black, colorButton: yellowColor).paddingSymmetric(horizontal: 20, vertical: 12),
      ),
      body: backgroundContainer(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reviewOrderAppBar(text: "Order now", isBack: true,bottomSpace: 16,topSpace: 0),
                // textWidget(
                //   text: "Order now",
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold,
                // ).paddingOnly(bottom: 20),
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
                          textWidget(text: "Shipping to: "),
                          Expanded(
                              child: textWidget(
                            text:
                                '${orderController.selectedAddress[0].fullName}, $shippingAddress',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                          )),
                        ],
                      ).paddingOnly(left: 16, right: 16, top: 16, bottom: 10),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => textWidget(
                              text: 'Items (${cartController.totalItems}): ')),
                          Obx(
                            () =>
                                textWidget(text: "\$${cartController.totalAmount.toStringAsFixed(2)}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,)
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 16, vertical: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textWidget(text: 'Delivery: '),
                          textWidget(text: "\$00.00",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,)
                        ],
                      ).paddingSymmetric(
                        horizontal: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textWidget(text: "Order Total: ",fontSize: 20,
                            fontWeight: FontWeight.w600,),
                          Obx(
                            () =>
                            textWidget(text: "\$${cartController.totalAmount.toStringAsFixed(2)}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: primary
                            )
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 16, vertical: 12),
                      const Divider(),
                      Obx(
                        () =>
                        textWidget(text: "Your Savings: \$${cartController.totalSavings.toStringAsFixed(2)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ).paddingOnly(left: 16),
                      ),
                      textWidget(text: "• Item discount",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500,).paddingOnly(left: 41, bottom: 16),
                    ],
                  ),
                ),
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
                      textWidget(text: "Deliver to",fontSize: 20,).paddingOnly(left: 16, top: 16),
                      InkWell(
                        onTap: () {
                          // Get.to(() => const SelectAddressScreen());
                        },
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget(text: orderController.selectedAddress[0].fullName
                                    .toString(),fontWeight: FontWeight.bold,),
                                textWidget(text: shippingAddress,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,)
                              ],
                            )),
                            const Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ).paddingAll(16),
                      ),
                    ],
                  ),
                ).paddingSymmetric(vertical: 16),
                textWidget(text: "Get it by",maxLines: 1,
                  overflow: TextOverflow.ellipsis,fontSize: 20,),
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
                      Container(
                        decoration: BoxDecoration(
                          color: liteOrange,
                          border: Border.all(
                            color: orangeColor,
                            width: 2, //                   <--- border width here
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWidget(
                              text: "Tuesday 4 June",
                              maxLines: 1,
                              color: primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              children: [
                                textWidget(
                                  text: "Free ",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                textWidget(
                                    text: "Prime Delivery",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    color: secondary),
                              ],
                            ),
                          ],
                        ).paddingAll(16),
                      ).paddingAll(8),
                      const Divider(),
                      textWidget(
                        text: "Arriving 4 June 2024",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ).paddingOnly(
                        left: 16,
                      ),
                      textWidget(
                        text: "If you order in 5 hours and 58 minutes.",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ).paddingOnly(left: 16),
                      const Divider(),
                      Obx(
                        () => cartController.cartProductList.isEmpty
                            ? noListFound(text: "No item added")
                            : ListView.builder(
                                itemCount: cartController.cartProductList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return reviewProductCard(
                                      context: context,
                                      index: index,
                                      model: cartController.cartProductList[index]);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                textWidget(
                  textAlign: TextAlign.justify,
                  fontSize: 12,
                  text:
                      "By placing your order, you agree to VWeb's privacy notice and conditions of use.\n\nWhen your order is placed, we'll send you an e-mail message acknowledging receipt of your order. If you choose to pay using an electronic payment method (credit card or debit card), you will be directed to your bank's website to complete your payment. Your contract to purchase an item will not be complete until we receive your electronic payment and dispatch your item. If you choose to pay using Pay on Delivery (POD), you can pay using cash/card/net banking when you receive your item.See VWeb.in's Return Policy.",
                ).paddingSymmetric(vertical: 16)
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }

  // Future<void> makePayment(
  //     {required String amount, required String currency}) async {
  //   try {
  //     paymentIntent =
  //         await orderController.createPaymentIntent(amount, currency);
  //     await Stripe.instance.initPaymentSheet(
  //       paymentSheetParameters: SetupPaymentSheetParameters(
  //         paymentIntentClientSecret: paymentIntent!['client_secret'],
  //         style: ThemeMode.dark,
  //         merchantDisplayName: 'Adnan',
  //       ),
  //     );
  //     displayPaymentSheet(transactionNum: paymentIntent!['id']);
  //   } catch (e) {
  //     orderController.paymentLoading(false);
  //     if (kDebugMode) {
  //       print("exception $e");
  //     }
  //   }
  // }
  //
  // displayPaymentSheet({required String transactionNum}) async {
  //   orderController.paymentLoading(false);
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //     await orderController.addOrderApi();
  //     paymentIntent = null;
  //   } on StripeException catch (e) {
  //     debugPrint('Error: $e');
  //     showToast(message: "something went wrong");
  //     showDialog(
  //       context: context,
  //       builder: (_) =>  AlertDialog(
  //         content: InkWell(
  //             onTap: (){
  //               Get.back();
  //             },
  //             child: textWidget(text: "Cancelled")),
  //       ),
  //     );
  //   } catch (e) {
  //     debugPrint('$e');
  //   }
  // }
}
