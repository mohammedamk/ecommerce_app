import 'package:ecommerce/models/customers/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/controller_const.dart';
import '../../../../constants/styles.dart';
import '../../../../widgets/widgets.dart';
import '../../../models/admin/products/ProductsModel.dart';
import '../product_details.dart';

//============================  search Text Field ==========================
Widget searchWidget({required SearchController controller}) {
  return SizedBox(
    height: 45,
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      onChanged: (val) {
        // adminProductController.searchText(val);
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1,
            color: secondary,
          ),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: secondary,
        ),
        fillColor: Colors.transparent,
        hintText: 'Search',
        hintStyle: const TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1,
            color: secondary,
          ),
        ),
        // filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    ),
  );
}

//=============================  Gridview List =============================
Widget gridWidget({required RxList<Products> list}) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 350,
        // crossAxisSpacing: 4,
        mainAxisSpacing: 4),
    itemCount: 50,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Get.to(() => const ProductsDetailsScreen(
                // model: list[index],
              ));
        },
        child: productCard(context: context, index: index,
            // model: list[index]
        ),
      );
    },
  );
}

//=============================  Product Card =============================
Widget productCard(
    {
      required BuildContext context,
    required int index,
    // required ProductData modal
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          networkImage(image: "https://www.outfitbuzz.com/cdn/shop/products/0962436800_2_3_1.jpg?v=1696538232&width=1780", borderRadius: 0,boxFit: BoxFit.fill,
            width: Get.width * 0.5,
            height: 264,).paddingOnly(bottom: 5),


          Card(
            color: primary,
            child: textWidget(
                    text: "-10%",
                    color: white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold)
                .paddingSymmetric(horizontal: 8, vertical: 6),
          ).paddingSymmetric(horizontal: 10, vertical: 10),

        ],
      ),
      // Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     ratingStar(
      //         value:4
      //         // double.parse(model.rating.toString())
      //         , color: deepOrange),
      //     textWidget(text: " (4)"),
      //   ],
      // ),
      textWidget(
        // text: model.brand ?? model.category.toString(),
        text: "Breshka",
        fontSize: 12,
        color: subtitleColor,
      ).paddingSymmetric(horizontal: 5, vertical: 3),
      textWidget(
              text: "Red Dress",
              // text: model.title.toString(),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
              maxLines: 1)
          .paddingSymmetric(
        horizontal: 5,
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              // text: model.price.toString(),
              text: "\$ 300",
              style: lineThroughTextStyle,
            ),
            TextSpan(
              // text: "\$${(double.parse(model.price.toString()) - ((double.parse(model.price.toString()) * double.parse(model.discountPercentage.toString())) / 100)).toStringAsFixed(2)}",
              text: "  \$ 250",

              style: titleTextStyle,
            ),
          ],
        ),
      ).paddingOnly(left: 5),
    ],
  );
}

//=============================  Expanded Row =============================

Widget expandedRow({required String title}) {
  // <---  Expanded Row can open and close
  return Column(
    children: [
      const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const Icon(Icons.arrow_drop_down)
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 8),
    ],
  );
}

//=============================  Return Policy and Warranty common column =============================

Widget returnPolicyWarranty({required Widget widget, required String text}) {
  return Column(
    children: [
      CircleAvatar(radius: 24, backgroundColor: litePink, child: widget)
          .paddingSymmetric(vertical: 8),
      textWidget(
        text: text,
        color: secondary,
        fontSize: 16,
      ),
    ],
  );
}
