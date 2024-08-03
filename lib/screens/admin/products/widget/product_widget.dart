import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/controller_const.dart';
import '../../../../constants/styles.dart';
import '../../../../models/admin/products/products_model.dart';
import '../../../../widgets/widgets.dart';
import '../product_details.dart';

void showDeleteConfirmationDialog(String productName, Function onDeleteConfirmed) {
  Get.defaultDialog(
    title: 'Delete Product',
    middleText: 'Are you sure you want to delete the product "$productName"?',
    textConfirm: 'Yes',
    textCancel: 'No',
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.black,
    buttonColor: Colors.red,
    onConfirm: () {
      onDeleteConfirmed();
      Get.back(); // Close the dialog
    },
    onCancel: () {
      Get.back(); // Close the dialog
    },
  );
}

//============================  search Text Field ==========================
Widget searchWidget({required SearchController controller}) {
  return SizedBox(
    height: 45,
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      onChanged: (val) {
        adminProductController.searchText(val);
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
Widget gridWidget({required RxList<ProductData> list}) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 302,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4),
    itemCount: list.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Get.to(() => ProductsDetailsScreen(
                model: list[index],
              ));
        },
        child: productCard(context: context, index: index, model: list[index]),
        // child: productCard(),
      );
    },
  );
}

//=============================  Product Card =============================
Widget productCard(
    {required BuildContext context,
    required int index,
    required ProductData model}
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          Column(
            children: [
              networkImage(image: model.imageUrls![0], borderRadius: 20,width: 148,
                height: 184,boxFit: BoxFit.cover).paddingOnly(bottom: 10,top: 15,right: 15),
            ],
          ),
          Positioned(
            top: 18,
            left: 2,
            child: Card(
              color: primary,
              child: textWidget(
                      text: "-${model.discountPercentage}%",
                      // text: "-18.56%",
                      color: white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold)
                  .paddingSymmetric(horizontal: 6, vertical: 6),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                color: white,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(primary),
                ),
                onPressed: () {

                },
                icon: Icon(
                  Icons.edit_outlined,
                  color: white,
                )),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
                color: white,
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(primary),

                    // shadowColor: WidgetStateProperty.all(liteBlack),
                    // side: WidgetStateProperty.all(
                    //     BorderSide(color: liteBlack, width: 2))
                ),
                onPressed: () {
                  showDeleteConfirmationDialog(model.title.toString(), (){
                    adminProductController.deleteProductApi(productId: model.productId.toString(),redirect: "Admin");
                  });
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: white,
                )),
          )
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ratingStar(
              value:
              // double.parse(model.rating.toString()),
              4,
              color: primary),
          // textWidget(text: " (${model.reviews?.length})"),
          textWidget(text: " (3)"),
        ],
      ),
      textWidget(
        text: model.brand ?? model.category.toString(),
        // text: "brand Name",
        fontSize: 12,
        color: secondary,
      ).paddingSymmetric(horizontal: 5, vertical: 5),
      textWidget(
              text: model.title.toString(),
              // text: "Title",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              maxLines: 1)
          .paddingSymmetric(
        horizontal: 5,
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              // text: "\$445",
              text: "\$${model.price.toString()}",
              style: lineThroughTextStyle,
            ),
            TextSpan(
              text:
              // "\$225",
              "\$${(double.parse(model.price.toString()) - ((double.parse(model.price.toString()) * double.parse(model.discountPercentage.toString())) / 100)).toStringAsFixed(2)}",
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


Widget productAppBar({required String text,double?topSpace,double?bottomSpace,required bool isBack}){
  return isBack?
  Row(
    children: [
      IconButton(onPressed: (){
        adminProductController.clearController();
        Get.back();}, icon: const Icon(Icons.arrow_back)),
      const Spacer(),
      textWidget(text: text, fontSize: 20,fontWeight: FontWeight.bold).paddingOnly(right: 45),
      const Spacer(),
    ],
  ).paddingOnly(top:topSpace??40,bottom: bottomSpace??16):
  Center(child: textWidget(text: text, fontSize: 20,fontWeight: FontWeight.bold)).paddingOnly(top:topSpace??40,bottom: bottomSpace??16);
}