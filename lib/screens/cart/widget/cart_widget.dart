import 'package:ecommerce/screens/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/widgets.dart';

Widget cartPageCard(
    // {
    //   required BuildContext context,
    // required int index,
    // required AddedProducts model,
    // required String cartId
    // }
    ) //       <------- cart Card
{
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0,
        ),
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: (){
                    Get.to(()=>const ProductsDetailsScreen());
                  },
                  child: networkImage(
                      image: "",
                      borderRadius: 20,
                      width: 88,
                      height: 110,
                      boxFit: BoxFit.cover),
                ),
                Card(
                  color: primary,
                  child: textWidget(
                          // text: "-${model.productDetails?.discountPercentage}%",
                          text: "-10%",
                          color: white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold)
                      .paddingSymmetric(horizontal: 6, vertical: 6),
                ),
              ],
            ).paddingOnly(right: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textWidget(
                    // text: model.productDetails?.description ?? "",
                    text: "Lorem ipsum odor amet, consectetuer adipiscing elit. Egestas elementum congue neque elementum per blandit! Feugiat malesuada et lacinia massa massa nam efficitur quam.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      textWidget(
                            text: "\$ 240",
                                // "\$${(double.parse(model.productDetails?.price.toString() ?? "1") * double.parse(model.quantity!.value.toString() ?? "1")).toStringAsFixed(2)} ",
                            color: secondary,
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough),
                      textWidget(
                          text:"260",
                              // "\$${((double.parse(model.productDetails?.price.toString() ?? "1") - ((double.parse(model.productDetails?.price.toString() ?? "1") * double.parse(model.productDetails?.discountPercentage.toString() ?? "1")) / 100)) * double.parse(model.quantity!.value.toString() ?? "1")).toStringAsFixed(2)}",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                    ],
                  ),
                  textWidget(
                    text:  "Only few are left",
                    // model.productDetails?.availabilityStatus ?? "",
                    color: primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ).paddingSymmetric(vertical: 2),
                ],
              ),
            )
          ],
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            iconBtn(
                icon: Icons.remove,
                onTap: () {
                  // model.quantity!.value = model.quantity!.value - 1;
                  // cartController.updateProductQuantityBtn(
                  //     productId: model.productId.toString(),
                  //     cartId: cartId,
                  //     quantity: (model.quantity!.value).toString());
                  // debugPrint(model.quantity!.value.toString());
                },
                isLeft: true),
            // Obx(() =>
            // 2.obs == 1.obs
            //     ? iconBtn(
            //         icon: Icons.delete_outline_outlined,
            //         onTap: () {
            //           // cartController.deleteCartProductBtn(
            //           //     cartId: cartId,
            //           //     productId: model.productId.toString(),
            //           //     index: index);
            //         },
            //         isLeft: true)
            //     : iconBtn(
            //         icon: Icons.remove,
            //         onTap: () {
            //           // model.quantity!.value = model.quantity!.value - 1;
            //           // cartController.updateProductQuantityBtn(
            //           //     productId: model.productId.toString(),
            //           //     cartId: cartId,
            //           //     quantity: (model.quantity!.value).toString());
            //           // debugPrint(model.quantity!.value.toString());
            //         },
            //         isLeft: true)),
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
                  text: "2",
                  // model.quantity!.value.toString(),
                  fontWeight: FontWeight.w600,
                ).paddingSymmetric(horizontal: 20, vertical: 6),
            ),
            iconBtn(
                    icon: Icons.add,
                    onTap: () {
                      // model.quantity!.value = model.quantity!.value + 1;
                      // cartController.updateProductQuantityBtn(
                      //     productId: model.productId.toString(),
                      //     cartId: cartId,
                      //     quantity: (model.quantity!.value).toString());
                      // debugPrint(model.quantity!.value.toString());
                    },
                    isLeft: false)
                .paddingOnly(right: 20),
            TextButton(
                onPressed: () {
                  // cartController.deleteCartProductBtn(
                  //     cartId: cartId,
                  //     productId: model.productId.toString(),
                  //     index: index);
                },
                style: ButtonStyle(
                    elevation: WidgetStateProperty.all(3), //Defines Elevation
                    shadowColor: WidgetStateProperty.all(Colors.black),
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(12)))),
                child: textWidget(
                  text: "Delete",
                  fontSize: 16,
                ).paddingSymmetric(horizontal: 6, vertical: 2)),
          ],
        )
      ],
    ),
  ).paddingSymmetric(vertical: 10);
}

Widget iconBtn(
    {required IconData icon,
    required Function() onTap,
    required bool
        isLeft}) //       <------- Icon button for delete, increase and decrease quantity
{
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          boxShadow: [
            BoxShadow(
              color: secondary,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isLeft ? 8 : 0),
            bottomLeft: Radius.circular(isLeft ? 8 : 0),
            topRight: Radius.circular(isLeft ? 0 : 8),
            bottomRight: Radius.circular(isLeft ? 0 : 8),
          )),
      child: Icon(icon).paddingAll(6),
    ),
  );
}
