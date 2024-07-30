// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vweb_ecommerce/constants/controller_const.dart';
// import 'package:vweb_ecommerce/widgets/widgets.dart';
// import '../../../constants/colors.dart';
// import '../address/select_address.dart';
// import 'widget/cart_widget.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: appBar(title: "CART"),
//       body: backgroundContainer(
//         child: Obx(
//           () => productController.cartList.isEmpty
//               ? noListFound(text: "Cart is Empty")
//               : SingleChildScrollView(
//                 physics: AlwaysScrollableScrollPhysics(),
//                   child: SafeArea(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         commonAppBar(text: "CART", isBack: false,bottomSpace: 16,topSpace: 0),
//
//                         filledButton(
//                                 height: 45,
//                                 onPressed: () {
//                                   Get.to(() => const SelectAddressScreen());
//                                 },
//                                 text:
//                                     "Proceed to Buy (${productController.totalItems} Items)",
//                                 textColor: white,
//                                 colorButton: primary)
//                             .paddingOnly(bottom: 12),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             textWidget(
//                               text: "Total Amount:",
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             textWidget(
//                               text:
//                                   "\$${productController.totalAmount.toStringAsFixed(2)}",
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ],
//                         ).paddingOnly(bottom: 12),
//                         const Divider(),
//                         ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: productController.cartList.length,
//                             itemBuilder: (context, index) {
//                               return cartCard(
//                                   context: context,
//                                   index: index,
//                                   model: productController.cartList[index]);
//                             })
//
//                       ],
//                     ).paddingAll(16),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
//
//
// }
