import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/constants/controller_const.dart';
import 'package:ecommerce/screens/admin/products/add_product.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../products/widget/product_widget.dart';
import 'collections/add_collections.dart';
import 'collections/collection_detils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: textWidget(
            text: "Dashboard",
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w500),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => collectionsController.loading.value ||
                      collectionsController.collectionsList.isEmpty
                  ? InkWell(
                      onTap: () {
                        Get.to(() => const AddCollectionPage());
                      },
                      child: SizedBox(
                        height: 220,
                        width: double.infinity,
                        child: Card(
                          color: white,
                          elevation: 10,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add),
                              textWidget(
                                  text: "Add Collection",
                                  color: black,
                                  textAlign: TextAlign.center,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ],
                          )),
                        ),
                      ),
                    ).paddingAll(16)
                  : const SizedBox.shrink(),
            ),
            Obx(
              () => collectionsController.loading.value ||
                      collectionsController.collectionsList.isEmpty
                  ? const SizedBox.shrink()
                  : textWidget(
                          text: "Collections",
                          color: black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500)
                      .paddingAll(16),
            ),
            Obx(
              () => collectionsController.loading.value ||
                      collectionsController.collectionsList.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 240,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              collectionsController.collectionsList.length + 1,
                          itemBuilder: (context, index) {
                            // var model = collectionsController.collectionsList[index];
                            return index ==
                                    collectionsController.collectionsList.length
                                ? InkWell(
                                    onTap: () {
                                      Get.to(() => const AddCollectionPage());
                                    },
                                    child: SizedBox(
                                      height: 220,
                                      width: 150,
                                      child: Card(
                                        elevation: 5,
                                        color: white,
                                        child: Center(
                                            child: textWidget(
                                                text: " + Add\nCollection ",
                                                color: black,
                                                textAlign: TextAlign.center,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ).paddingSymmetric(
                                    horizontal: 16, vertical: 5)
                                : InkWell(
                                    onTap: () {
                                      Get.to(()=> CollectionDetailsPage(collectionId: collectionsController.collectionsList[index].collectionId.toString(),));
                                    },
                                    child: SizedBox(
                                      height: 220,
                                      width: 150,
                                      child: Card(
                                        elevation: 5,
                                        color: white,
                                        child: Center(
                                            child: textWidget(
                                                text:
                                                    "${collectionsController.collectionsList[index].title}",
                                                color: black,
                                                textAlign: TextAlign.center,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ).paddingSymmetric(
                                    horizontal: 16, vertical: 5);
                          }),
                    ),
            ),
            Obx(
              () => adminProductController.loading.value ||
                      adminProductController.productList.isEmpty
                  ? InkWell(
                      onTap: () {
                        Get.to(() => const AddProductScreen());
                      },
                      child: SizedBox(
                        height: 220,
                        width: double.infinity,
                        child: Card(
                          color: white,
                          elevation: 10,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add),
                              textWidget(
                                  text: "Add Products",
                                  color: black,
                                  textAlign: TextAlign.center,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ],
                          )),
                        ),
                      ),
                    ).paddingAll(16)
                  : const SizedBox.shrink(),
            ),
            Obx(
              () => adminProductController.loading.value ||
                      adminProductController.productList.isEmpty
                  ? const SizedBox.shrink()
                  : InkWell(
                      onTap: () {
                        adminDashboardController.selectedIndex.value = 1;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textWidget(
                                  text: "Products",
                                  color: black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500)
                              .paddingAll(16),
                          textWidget(
                                  text: "View All",
                                  color: black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)
                              .paddingAll(16),
                        ],
                      ),
                    ),
            ),
            Obx(
              () => adminProductController.loading.value ||
                      adminProductController.productList.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 342,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              (adminProductController.productList.length > 6
                                  ? 6
                                  : adminProductController.productList.length),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: productCard(
                                  context: context,
                                  index: index,
                                  model: adminProductController
                                      .productList[index]),
                            ).paddingSymmetric(horizontal: 16, vertical: 5);
                          }),
                    ),
            ),
            // textWidget(
            //     text: "Today's Orders",
            //     color: black,
            //     fontSize: 24,
            //     fontWeight: FontWeight.w500).paddingAll(16),
            // ListView.builder(
            //
            //     physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //     itemCount: 4,
            //     itemBuilder: (context,index){
            //   return Container(
            //     decoration: BoxDecoration(
            //       color: white,
            //       border: Border.all(
            //         color: liteBlack,
            //         width: 1, //                   <--- border width here
            //       ),
            //
            //       borderRadius: const BorderRadius.all(
            //         Radius.circular(8),
            //       ),
            //     ),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             textWidget(
            //                 // text: "Order No. ${model.orderId}",
            //                 text: "Order No. 1",
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 18),
            //             const Spacer(),
            //             textWidget(
            //               // text: DateFormat('dd MMM, yyyy').format(DateTime.parse((model.deliveryDate.toString()))),
            //               text: "06 June 2024",
            //               color: secondary,
            //             ),
            //           ],
            //         ).paddingOnly(bottom: 10),
            //         Row(
            //           children: [
            //             textWidget(text: "Quantity:", color: secondary),
            //             textWidget(
            //
            //               text: "3"
            //                 // text: model.totalItems.toString()
            //                 , fontWeight: FontWeight.bold),
            //             const Spacer(),
            //             textWidget(text: "Total Amount:", color: secondary),
            //             textWidget(
            //                 // text: "\$${model.totalAmount?.toStringAsFixed(2)}",
            //                 text: "\$2450.00",
            //                 fontWeight: FontWeight.bold),
            //           ],
            //         ).paddingOnly(bottom: 10),
            //         Row(
            //           children: [
            //             textWidget(text: "Order Status:", color: secondary),
            //             const Spacer(),
            //             textWidget(text: "Pending", color: primary,fontWeight: FontWeight.bold),
            //           ],
            //         ).paddingOnly(bottom: 10),
            //         Row(
            //           children: [
            //             textOutlinedButton(text: "Details", onPressed: () {
            //               // Get.to(()=>OrdersDetailsScreen(
            //               //   model: model,
            //               // ));
            //             }),
            //             const Spacer(),
            //             textWidget(
            //               text: "Delivered",
            //               color: primary,
            //               fontSize: 16,
            //             ),
            //           ],
            //         ).paddingOnly(bottom: 10),
            //         Row(
            //           children: [
            //             Expanded(child: filledButton(height: 50, onPressed: (){}, text: "Cancel", textColor: white, colorButton: Colors.red.shade700).paddingOnly(right: 8)),
            //             Expanded(child: filledButton(height: 50, onPressed: (){}, text: "Approve", textColor: white, colorButton: Colors.green).paddingOnly(left: 8)),
            //           ],
            //         ),
            //       ],
            //     ).paddingAll(16),
            //   ).paddingSymmetric(horizontal: 16,vertical: 10);
            // })
          ],
        ),
      ),
    );
  }
}
