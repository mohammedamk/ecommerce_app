import 'package:ecommerce/screens/products/product_details.dart';
import 'package:ecommerce/screens/products/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            SizedBox(
              height: 270,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Get.to(()=>const ProductsDetailsScreen());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/img_product.png",
                                height: 170,
                                width: 130,
                                fit: BoxFit.fill,
                              )),
                          Text(
                            "Dorothy Perkins",
                            style: TextStyle(fontSize: 12, color: subtitleColor),
                          ).paddingOnly(top: 6, left: 8),
                          const Text(
                            "Evening Dress",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ).paddingOnly(left: 8),
                          Row(
                            children: [
                              Text(
                                "\$15",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: subtitleColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough),
                              ).paddingOnly(left: 8),
                              Text(
                                "\$20",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: primary,
                                    fontWeight: FontWeight.bold),
                              ).paddingOnly(left: 8),
                              // const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                            ],
                          )
                        ],
                      ).paddingOnly(left: 10,right: 10,top: 10),
                    );
                  }),
            ),
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
            SizedBox(
              height: 270,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius:  BorderRadius.circular(20),
                            child: Image.asset("assets/images/img_product.png",height: 170,width: 130,fit: BoxFit.fill,)),
                        Text("Dorothy Perkins",style: TextStyle(fontSize: 12,color: subtitleColor),).paddingOnly(top: 6,left: 8),
                        const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                        Row(
                          children: [
                            Text("\$15",style: TextStyle(fontSize: 14,color: subtitleColor,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),).paddingOnly(left: 8),
                            Text("\$20",style: TextStyle(fontSize: 14,color: primary,fontWeight: FontWeight.bold),).paddingOnly(left: 8),
                            // const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                          ],
                        )
                      ],
                    ).paddingAll(10);
                  }),
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
            SizedBox(
              height: 270,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius:  BorderRadius.circular(20),
                            child: Image.asset("assets/images/img_product.png",height: 170,width: 130,fit: BoxFit.fill,)),
                        Text("Dorothy Perkins",style: TextStyle(fontSize: 12,color: subtitleColor),).paddingOnly(top: 6,left: 8),
                        const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                        Row(
                          children: [
                            Text("\$15",style: TextStyle(fontSize: 14,color: subtitleColor,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),).paddingOnly(left: 8),
                            Text("\$20",style: TextStyle(fontSize: 14,color: primary,fontWeight: FontWeight.bold),).paddingOnly(left: 8),
                            // const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                          ],
                        )
                      ],
                    ).paddingAll(10);
                  }),
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
            SizedBox(
              height: 270,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius:  BorderRadius.circular(20),
                            child: Image.asset("assets/images/img_product.png",height: 170,width: 130,fit: BoxFit.fill,)),
                        Text("Dorothy Perkins",style: TextStyle(fontSize: 12,color: subtitleColor),).paddingOnly(top: 6,left: 8),
                        const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                        Row(
                          children: [
                            Text("\$15",style: TextStyle(fontSize: 14,color: subtitleColor,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),).paddingOnly(left: 8),
                            Text("\$20",style: TextStyle(fontSize: 14,color: primary,fontWeight: FontWeight.bold),).paddingOnly(left: 8),
                            // const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                          ],
                        )
                      ],
                    ).paddingAll(10);
                  }),
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
            SizedBox(
              height: 270,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius:  BorderRadius.circular(20),
                            child: Image.asset("assets/images/img_product.png",height: 170,width: 130,fit: BoxFit.fill,)),
                        Text("Dorothy Perkins",style: TextStyle(fontSize: 12,color: subtitleColor),).paddingOnly(top: 6,left: 8),
                        const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                        Row(
                          children: [
                            Text("\$15",style: TextStyle(fontSize: 14,color: subtitleColor,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),).paddingOnly(left: 8),
                            Text("\$20",style: TextStyle(fontSize: 14,color: primary,fontWeight: FontWeight.bold),).paddingOnly(left: 8),
                            // const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
                          ],
                        )
                      ],
                    ).paddingAll(10);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
