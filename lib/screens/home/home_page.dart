import 'package:ecommerce/constants/controller_const.dart';
import 'package:ecommerce/screens/home/widget/widget.dart';
import 'package:ecommerce/screens/products/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    // productController.productListApi(isFirstTime: true,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/img_fashion.png",
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: SizedBox(
                    width: Get.width * 0.5,
                    child: Column(
                      children: [
                        const Text(
                          "Fashion Sale",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ).paddingOnly(bottom: 10),
                        SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {
                                Get.to(()=> const ProductsScreen());
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color(0xffDB3022))),
                              child: const Text("check"),
                            )).paddingOnly(right: 16)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "New",
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "You’ve never seen it before!",
                      style: TextStyle(fontSize: 12, color: subtitleColor),
                    ),
                  ],
                ).paddingSymmetric(vertical: 20),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>const ProductsScreen());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(fontSize: 12),
                      ).paddingAll(10),
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 16),
            Obx(
                    ()=>
            productController.productList.isNotEmpty?
            listWidget(context: context):const SizedBox.shrink()),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sale",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black),),
                    Text("Super summer sale",style: TextStyle(fontSize: 12,color: subtitleColor),),
                  ],
                ).paddingOnly(bottom: 20),
                 Column(
                   mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>const ProductsScreen());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(fontSize: 12),
                      ).paddingAll(10),
                    ),

                  ],
                ),

              ],
            ).paddingSymmetric(horizontal: 16),
            Obx(()=>
            productController.productList.isNotEmpty?
            listWidget(context: context):const SizedBox.shrink(),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Men's",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black),),
                    Text("Super summer sale",style: TextStyle(fontSize: 12,color: subtitleColor),),
                  ],
                ).paddingOnly(bottom: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>const ProductsScreen());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(fontSize: 12),
                      ).paddingAll(10),
                    ),

                  ],
                ),

              ],
            ).paddingSymmetric(horizontal: 16),
            Obx(()=>
            productController.productList.isNotEmpty?
            listWidget(context: context):const SizedBox.shrink(),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Women's",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black),),
                    Text("Super summer sale",style: TextStyle(fontSize: 12,color: subtitleColor),),
                  ],
                ).paddingOnly(bottom: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>const ProductsScreen());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(fontSize: 12),
                      ).paddingAll(10),
                    ),

                  ],
                ),

              ],
            ).paddingSymmetric(horizontal: 16),
            Obx(()=>
            productController.productList.isNotEmpty?
            listWidget(context: context):const SizedBox.shrink(),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Kids",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black),),
                    Text("Super summer sale",style: TextStyle(fontSize: 12,color: subtitleColor),),
                  ],
                ).paddingOnly(bottom: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>const ProductsScreen());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(fontSize: 12),
                      ).paddingAll(10),
                    ),

                  ],
                ),

              ],
            ).paddingSymmetric(horizontal: 16),
            Obx(()=>
            productController.productList.isNotEmpty?
            listWidget(context: context):const SizedBox.shrink(),
            ).paddingOnly(bottom: 40),
          ],
        ),
      ),
    );
  }
}
