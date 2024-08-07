import 'package:ecommerce/constants/controller_const.dart';
import 'package:ecommerce/screens/home/widget/widget.dart';
import 'package:ecommerce/screens/products/products.dart';
import 'package:ecommerce/utils/app_utils.dart';
import 'package:ecommerce/widgets/widgets.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_){
      api();
    });
    super.initState();
  }

  Future<void> api()async{
    await collectionsController.fetchCollectionsWithProductsApi();

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
            Obx(()=>
            collectionsController.loading.value?showLoader():
                collectionsController.allCollectionsList.isEmpty?noListFound(text: "Coming soon"):
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: collectionsController.allCollectionsList.length,
                  itemBuilder: (context,index){
                    var model = collectionsController.allCollectionsList[index];
                return  Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title??"",
                              style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              model.description??"",
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
                    model.products!.isNotEmpty?
                                            listWidget(context: context,list: model.products!): SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(child: textWidget(text: "Coming Soon",fontWeight: FontWeight.w500,fontSize: 20)),
                    ),
                  ],
                );
              }),
            ),




          ],
        ),
      ),
    );
  }
}
