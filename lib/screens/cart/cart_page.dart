
import 'package:ecommerce/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../constants/controller_const.dart';
import '../../constants/styles.dart';
import '../../widgets/widgets.dart';
import '../customer/address/select_address.dart';
import 'widget/cart_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(title: "CART"),
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: textWidget(
            text: "My Bag", fontSize: 20, fontWeight: FontWeight.w500),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
      body: Obx(
            () => cartController.cartProductList.isEmpty
            ? Center(
              child: Column(
                children: [
                  SizedBox(height: Get.height*0.3,),
                  Text(
                    "Your Bag",
                    style:
                    titleLargeTextStyle(fontSize: 28, color: black,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Your Bag is currently empty",
                    style:
                    titleLargeTextStyle(fontSize: 16, color: black,),
                  ).paddingOnly(top: 6,bottom: 30),

                  SizedBox(
                    height: 45,
                    width: 230,
                    child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(black),
                          shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))))),
                      onPressed: (){
                        Get.offAll(()=>const DashBoardScreen(currentIndex: 1));
                      },
                      child: textWidget(
                          text: "Continue shopping",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: white),

                    ),
                  ),
                  // SizedBox(
                  //     width: 220,
                  //     child: filledButton(height: 50, onPressed: (){}, text: "Continue Shopping", textColor: white, colorButton: black))
                  // commonBtn(text: "Continue Shopping", onTap: (){},color: Colors.black)
                ],
              ),
            )
            : SingleChildScrollView(
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
                      Get.to(() => const SelectAddressScreen());
                    },
                    text:
                    "Proceed to Buy (${cartController.totalItems} Items)",
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
                    Obx(()=> textWidget(
                      text:
                      "\$${cartController.totalAmount.toStringAsFixed(2)}",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ],
                ).paddingOnly(bottom: 12),
                const Divider(),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartController.cartProductList.length,
                    itemBuilder: (context, index) {
                      return cartPageCard(
                          context: context,
                          index: index,
                          model: cartController.cartProductList[index],
                          cartId: cartController.cartList[0].cartId.toString()
                      );
                    })

              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }


}
