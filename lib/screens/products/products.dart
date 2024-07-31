import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/controller_const.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/widgets.dart';
import 'widget/product_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // adminProductController.packageListScrollController.addListener(() {
  //   //   if (adminProductController
  //   //           .packageListScrollController.position.maxScrollExtent ==
  //   //       adminProductController.packageListScrollController.offset) {
  //   //     adminProductController.productListPagination();
  //   //   }
  //   // });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: textWidget(
            text: "Shopping", fontSize: 20, fontWeight: FontWeight.w500),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body:
          // SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(
          //         height: 35,
          //         child: ListView.builder(
          //           shrinkWrap: true,
          //           scrollDirection: Axis.horizontal,
          //             itemCount: 10,
          //             itemBuilder: (context,index){
          //           return
          //               Card(
          //                 child: textWidget(text: "Categories",fontSize: 12,fontWeight: FontWeight.w500).paddingSymmetric(horizontal: 8,vertical: 3),
          //               );
          //         }),
          //       ),
          //       textWidget(text: "Men's Clothing",fontSize: 20,fontWeight: FontWeight.w500).paddingAll(20),
          //       Padding(
          //         padding: const EdgeInsets.all(20.0),
          //         child: Row(
          //           children: [
          //             Image.asset("assets/icons/ic_filter.png",height: 24,width: 20,).paddingOnly(right: 8),
          //             textWidget(text: "Filter and sort",fontSize: 12,),
          //             const Spacer(),
          //             textWidget(text: "Showing 326 Results",fontSize: 12,)
          //
          //           ],
          //         ),
          //       ),
          //
          //       gridWidget(
          //           list: productController.productList),
          //     ],
          //   ),
          // ),
          Obx(
        () => RefreshIndicator(
          onRefresh: () {
            productController.productSearchController.clear();
            return productController.productListApi(isFirstTime: true);
          },
          child: productController.loading.value
              ? showLoader()
              : productController.productList.isEmpty
                  ? noListFound(text: "Post Not Found")
                  : ListView(
                      controller: productController.packageListScrollController,
                      children: [
                        SizedBox(
                          height: 35,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: textWidget(
                                          text: "Categories",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)
                                      .paddingSymmetric(
                                          horizontal: 8, vertical: 3),
                                );
                              }),
                        ).paddingOnly(top: 16,left:10,right: 10),
                        searchWidget(
                            controller:
                            productController.productSearchController)
                            .paddingAll(16),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/ic_filter.png",
                                height: 24,
                                width: 20,
                              ).paddingOnly(right: 8),
                              textWidget(
                                text: "Filter and sort",
                                fontSize: 12,
                              ),
                              const Spacer(),
                              textWidget(
                                text: "Showing 326 Results",
                                fontSize: 12,
                              )
                            ],
                          ),
                        ),

                        gridWidget(list: productController.productList)
                        // Obx(
                        //   () =>
                        //   productController
                        //               .searchText.value.isNotEmpty &&
                        //           productController
                        //               .filteredProductList.isEmpty
                        //       ? noListFound(text: "No data found")
                        //       :
                        //   adminProductController.searchText.value.isEmpty
                        //           ? gridWidget(
                        //                   list: adminProductController.productList)
                        //
                        //           : gridWidget(
                        //                   list: adminProductController
                        //                       .filteredProductList)
                        //               ,
                        // ),
                      ],
                    ),
        ),
      ),
    );
  }
}
