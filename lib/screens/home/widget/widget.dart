import 'package:ecommerce/models/admin/products/ProductsModel.dart';
import 'package:ecommerce/models/customers/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/controller_const.dart';
import '../../../widgets/widgets.dart';
import '../../products/product_details.dart';

Widget dashboardProductCard ({
  required BuildContext context,
  required int index,
  required ProductData model
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      networkImage(image: model.imageUrls![0].toString(), borderRadius: 20,height: 170,
        width: 130,
        boxFit: BoxFit.fill
        ,),
      Text(
        model.brand ?? model.category??"",
        style: TextStyle(fontSize: 12, color: subtitleColor),
      ).paddingOnly(top: 6, left: 8),
      Expanded(
        child: SizedBox(
          width: 130,
          child: Text(
            model.title ??"",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,

                color: Colors.black),
          ).paddingOnly(left: 8),
        ),
      ),
      Row(
        children: [
          Text(
            "\$${model.price}",
            style: TextStyle(
                fontSize: 14,
                color: subtitleColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough),
          ).paddingOnly(left: 8),
          Text(
            "\$${(double.parse(model.price.toString()) - ((double.parse(model.price.toString()) * double.parse(model.discountPercentage.toString())) / 100)).toStringAsFixed(2)}",

            // "\$${model.discountPercentage}",
            style: TextStyle(
                fontSize: 14,
                color: primary,
                fontWeight: FontWeight.bold),
          ).paddingOnly(left: 8),
          // const Text("Evening Dress",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),).paddingOnly(left: 8),
        ],
      )
    ],
  );
}

Widget listWidget({required BuildContext context}){
  return SizedBox(
    height: 270,
    child: ListView.builder(
        itemCount: adminProductController.productList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.to(()=> ProductsDetailsScreen(model: adminProductController.productList[index],));
            },
            child: dashboardProductCard(context: context, index: index, model: adminProductController.productList[index]).paddingOnly(left: 10,right: 10,top: 10),
          );
        }),
  ).paddingOnly(bottom: 16);
}