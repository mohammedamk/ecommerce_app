import 'dart:io';
import 'package:ecommerce/models/admin/products/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/controller_const.dart';
import '../../../constants/images.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/widgets.dart';
import 'widget/product_widget.dart';

class AddProductScreen extends StatefulWidget {
  final bool isFromEdit;
  final ProductData? model;
  const AddProductScreen({super.key, required this.isFromEdit, this.model});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}


class _AddProductScreenState extends State<AddProductScreen> {


  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_){
      if(widget.isFromEdit){
        adminProductController.editScreenApi(model: widget.model!);

      }
    });
    super.initState();
  }

  Future<void> editScreenApi()async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: textWidget(text:"Add New Product",fontSize: 16,fontWeight: FontWeight.bold),centerTitle: true,),
      bottomNavigationBar: Obx(()=>
      adminProductController.loading.value?
          SizedBox(
              height: 45,
              child: showLoader()):
          filledButton(
            height: 45,
            onPressed: (){
              if(widget.isFromEdit){

              }else{
                adminProductController.addProductBtn(redirect: "Admin");
              }
            },
            text: widget.isFromEdit?"Edit Product":"Add this Product",
            textColor: white,
            colorButton: primary)
            .paddingAll(16),
      ),
      body: backgroundContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productAppBar(
              text: widget.isFromEdit?"Edit Product":"Add New Product",
              isBack: true,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  titleTextWidget(text: "Title").paddingOnly(bottom: 16),
                  //  Essence Mascara Lash Princess
                  textTile(
                      hintText: "Eg. Essence Mascara Lash Princess",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.titleController,
                    prefixImg: icTitle
                  ),
                  titleTextWidget(text: "Category",)
                      .paddingSymmetric(vertical: 16),
                  //"category": "beauty"
                  textTile(
                      hintText: "Eg. beauty",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.categoryController,
                      prefixImg: icCategory

                  ),

                  titleTextWidget(text: "Price").paddingSymmetric(vertical: 16),
                  //"price": 9.99
                  textTile(
                      hintText: "Eg. 9.99",
                      keyboardType: TextInputType.number,
                      controller: adminProductController.priceController,
                      prefixImg: icPrice
                  ),

                  titleTextWidget(text: "Discount Percentage")
                      .paddingSymmetric(vertical: 16),
                  //"discountPercentage": 7.17
                  textTile(
                      hintText: "Eg. 7.17",
                      keyboardType: TextInputType.number,
                      controller: adminProductController.discountController,
                      prefixImg: icDiscount
                  ),

                  titleTextWidget(text: "Stocks")
                      .paddingSymmetric(vertical: 16),
                  // "stock" :54
                  textTile(
                      hintText: "Eg. 54",
                      keyboardType: TextInputType.number,
                      controller: adminProductController.stocksController,
                      prefixImg: icStock
                  ),

                  titleTextWidget(text: "Brand").paddingSymmetric(vertical: 16),
                  //"brand": "Essence",
                  textTile(
                      hintText: "Eg. Essence",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.brandController,
                      prefixImg: icBrand
                  ),

                  titleTextWidget(text: "SKU").paddingSymmetric(vertical: 16),
                  //"sku": "RCH45Q1A",
                  textTile(
                      hintText: "Eg. RCH45Q1A",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.skuController,
                      prefixImg: icSku
                  ),

                  titleTextWidget(text: "weight")
                      .paddingSymmetric(vertical: 16),
                  //"weight": 2,
                  textTile(
                      hintText: "Eg. 200",
                      keyboardType: TextInputType.number,
                      controller: adminProductController.weightController,
                      prefixImg: icWeight),

                  titleTextWidget(text: "Dimensions")
                      .paddingSymmetric(vertical: 16),

                  Row(
                    children: [

                      Expanded(
                        child: Column(
                          children: [
                            titleTextWidget(text: "Length")
                                .paddingOnly(bottom: 8),
                            dimensionTextTile(
                                hintText: "Eg. 10",
                                keyboardType: TextInputType.number,
                                controller: adminProductController.lengthController),
                          ],
                        ),
                      ),
                      const Icon(Icons.close).paddingSymmetric(horizontal: 6),
                      Expanded(
                        child: Column(
                          children: [
                            titleTextWidget(text: "Width")
                                .paddingOnly(bottom: 8),
                            dimensionTextTile(
                                hintText: "Eg. 230",
                                keyboardType: TextInputType.number,
                                controller: adminProductController.widthController),
                          ],
                        ),
                      ),
                      const Icon(Icons.close).paddingSymmetric(horizontal: 6),

                      Expanded(
                        child: Column(
                          children: [
                            titleTextWidget(text: "Height")
                                .paddingOnly(bottom: 8),
                            dimensionTextTile(
                                hintText: "Eg. 200",
                                keyboardType: TextInputType.number,
                                controller: adminProductController.heightController),
                          ],
                        ),
                      ),

                    ],
                  ),
                  titleTextWidget(text: "warranty")
                      .paddingSymmetric(vertical: 16),
                  //"warrantyInformation": "1 month warranty",
                  textTile(
                      hintText: "Eg. 1 month warranty",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.warrantyController,
                      prefixImg: icWarranty),

                  titleTextWidget(text: "shipping Information")
                      .paddingSymmetric(vertical: 16),
                  //"shippingInformation": "Ships in 1 month",
                  textTile(
                      hintText: "Eg. Ships in 1 month",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.shippingController,
                      prefixImg: icShipping),

                  titleTextWidget(text: "return Policy")
                      .paddingSymmetric(vertical: 16),
                  //"returnPolicy": "30 days return policy",
                  textTile(
                      hintText: "Eg. 30 days return policy",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.returnController,
                    prefixImg: icReturn
                  ),

                  titleTextWidget(text: "Minimum Order Quantity")
                      .paddingSymmetric(vertical: 16),
                  //"minimumOrderQuantity": 24,
                  textTile(
                      hintText: "Eg. 24",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.minQtyController,

                      prefixImg: icQuantity
                  ),
                  titleTextWidget(text: "Description")
                      .paddingSymmetric(vertical: 16),
                  //"minimumOrderQuantity": 24,
                  textTile(
                      hintText: "Eg. This product is organic eco friendly",
                      keyboardType: TextInputType.text,
                      controller: adminProductController.descriptionController,
                      prefixImg: icQuantity,
                    maxLines: 5
                  ),
                  titleTextWidget(text: "Product Images")
                      .paddingSymmetric(vertical: 16),
                  //"images": ["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png]
                  Obx(
                        () => adminProductController.mediaFileList.isEmpty
                        ? InkWell(
                      onTap: () {
                        adminProductController.pickMultipleImages(
                            adminProductController.mediaFileList);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        height: 200,
                        width: double.infinity,
                        child:  Center(child: textWidget(text: "Pick Multiple Images")),
                      ).paddingOnly(top: 10, right: 5),
                    )
                        : GridView.builder(
                      shrinkWrap: true,
                      itemCount: adminProductController.mediaFileList.length + 1,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        int a = adminProductController.mediaFileList.length;
                        if (index == a) {
                          return InkWell(
                            onTap: () {
                              adminProductController.pickMultipleImages(
                                  adminProductController.mediaFileList);
                            },
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.black26, width: 2),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: const Center(child: Icon(Icons.add)),
                            ).paddingOnly(top: 4, right: 2),
                          );
                        } else {
                          return Stack(
                            // fit: StackFit.expand,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: ClipRRect(
                                        clipBehavior: Clip.antiAlias,
                                        // clipBehavior: Clip.antiAliasWithSaveLayer,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          File(adminProductController
                                              .mediaFileList[index].path),
                                          fit: BoxFit.cover,
                                        )).paddingAll(2),
                                  ).paddingOnly(top: 4, right: 2),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    adminProductController.mediaFileList
                                        .removeAt(index);
                                  },
                                  child: const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
