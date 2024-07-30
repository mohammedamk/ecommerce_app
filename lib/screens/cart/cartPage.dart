import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../widgets/widgets.dart';
import 'widget/cart_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(title: "CART"),
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: textWidget(text: "My Bag",fontSize: 20,fontWeight: FontWeight.w500),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_outlined))
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // commonAppBar(text: "CART", isBack: false,bottomSpace: 16,topSpace: 0),

              filledButton(
                  height: 45,
                  onPressed: () {
                    // Get.to(() => const SelectAddressScreen());
                  },
                  text:
                  // "Proceed to Buy (${cartController.totalItems} Items)",
                  "Proceed to Buy (4 Items)",
                  textColor: white,
                  colorButton: primary)
                  .paddingOnly(bottom: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget(
                    text: "Total Amount:",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textWidget(
                    text: "\$2000",
                    // "\$${cartController.totalAmount.toStringAsFixed(2)}",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ).paddingOnly(bottom: 12),
              const Divider(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return cartPageCard(
                      // context: context,
                      // index: index,
                      // model: cartController.cartProductList[index],
                      // cartId: cartController.cartList[0].cartId.toString()
                    );
                  })

            ],
          ).paddingAll(16),
        ),
      ),
      // Obx(
      //       () => cartController.cartProductList.isEmpty
      //       ? noListFound(text: "Cart is Empty")
      //       : SingleChildScrollView(
      //     physics: const AlwaysScrollableScrollPhysics(),
      //     child: SafeArea(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           commonAppBar(text: "CART", isBack: false,bottomSpace: 16,topSpace: 0),
      //
      //           filledButton(
      //               height: 45,
      //               onPressed: () {
      //                 // Get.to(() => const SelectAddressScreen());
      //               },
      //               text:
      //               // "Proceed to Buy (${cartController.totalItems} Items)",
      //               "Proceed to Buy (4 Items)",
      //               textColor: white,
      //               colorButton: primary)
      //               .paddingOnly(bottom: 12),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               textWidget(
      //                 text: "Total Amount:",
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //               Obx(()=> textWidget(
      //                   text: "\$2000",
      //                   // "\$${cartController.totalAmount.toStringAsFixed(2)}",
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.w600,
      //                 ),
      //               ),
      //             ],
      //           ).paddingOnly(bottom: 12),
      //           const Divider(),
      //           ListView.builder(
      //               shrinkWrap: true,
      //               physics: const NeverScrollableScrollPhysics(),
      //               itemCount: 4,
      //               itemBuilder: (context, index) {
      //                 return cartPageCard(
      //                     context: context,
      //                     index: index,
      //                     model: cartController.cartProductList[index],
      //                   cartId: cartController.cartList[0].cartId.toString()
      //                 );
      //               })
      //
      //         ],
      //       ).paddingAll(16),
      //     ),
      //   ),
      // ),
    );
  }


}
