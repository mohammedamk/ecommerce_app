import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/controller_const.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/widgets.dart';
import 'add_product.dart';
import 'widget/product_widget.dart';

class AdminProductsScreen extends StatefulWidget {
  const AdminProductsScreen({super.key});

  @override
  State<AdminProductsScreen> createState() => _AdminProductsScreenState();
}

class _AdminProductsScreenState extends State<AdminProductsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=>const AddProductScreen(isFromEdit: false,));
      },shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),backgroundColor: primary,child:  Icon(Icons.add,color: white,),),
        body: backgroundContainer(
          child: Obx(
                () => RefreshIndicator(
              onRefresh: () {
                adminProductController.productSearchController.clear();
                return adminProductController.productListApi(redirect: "Admin");
              },
              child: adminProductController.loading.value
                  ? showLoader()
                  : adminProductController.productList.isEmpty
                  ? noListFound(text: "Post Not Found")
                  : ListView(
                children: [
                  commonAppBar(text: "Products",topSpace: 20,isBack: false),
                  searchWidget(
                      controller:
                      adminProductController.productSearchController)
                      .paddingOnly(left: 16,right: 16,bottom: 16),
                  Obx(
                        () => adminProductController
                        .searchText.value.isNotEmpty &&
                        adminProductController
                            .filteredProductList.isEmpty
                        ? noListFound(text: "No data found")
                        : adminProductController.searchText.value.isEmpty
                        ? gridWidget(
                        list: adminProductController.productList)
                        .paddingAll(16)
                        : gridWidget(
                        list: adminProductController
                            .filteredProductList)
                        .paddingAll(16),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
