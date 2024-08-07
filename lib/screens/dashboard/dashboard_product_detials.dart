import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/collections/all_collections_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/widgets.dart';
import '../../constants/colors.dart';
import '../../constants/controller_const.dart';
import '../admin/products/widget/product_widget.dart';

class DashboardProductsDetailsScreen extends StatefulWidget {
  final AllCollectionsProducts model;

  const DashboardProductsDetailsScreen({super.key, required this.model});

  @override
  State<DashboardProductsDetailsScreen> createState() => _DashboardProductsDetailsScreenState();
}

class _DashboardProductsDetailsScreenState extends State<DashboardProductsDetailsScreen> {
  final CarouselController _controller = CarouselController();
  final _current = 0.obs;

  @override
  Widget build(BuildContext context) {
    var model = widget.model;
    final List<Widget> imageSliders = model.imageUrls!
        .map((item) => Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5.0),
      child:
      networkImage(image: item, borderRadius: 5,boxFit: BoxFit.cover),

    ))
        .toList();
    return Scaffold(
      // appBar: appBar(title: "Products Details"),
        body: backgroundContainer(
          child: SingleChildScrollView(
            child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonAppBarTwo(
                        text: "Products Details", topSpace: 0, bottomSpace: 0),
                    Row(
                      children: [
                        networkImage(image: model.thumbnail.toString(), borderRadius: 80,height: 60,
                          width: 60,
                          boxFit: BoxFit.fill,).paddingOnly(right: 8),
                        textWidget(
                            text: model.brand ?? model.category.toString(),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        ratingStar(
                          // value: double.parse(model.rating.toString()),
                            value: 4,
                            color: deepOrange)
                            .paddingOnly(
                          right: 5,
                        ),
                        textWidget(text: model.reviews!.length.toString()),
                      ],
                    ).paddingAll(8),
                    textWidget(
                        text: model.description.toString(),
                        color: secondary,
                        textAlign: TextAlign.justify)
                        .paddingSymmetric(horizontal: 16),
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlayCurve: Curves.linear,
                          height: 400,
                          // aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 1,
                          initialPage: 0,
                          autoPlay: model.imageUrls?.length == 1 ? false : true,
                          onPageChanged: (index, reason) {
                            _current.value = index;
                          }),
                      items: imageSliders,
                    ),
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: model.imageUrls!.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Obx(
                                    () => Container(
                                  width: 12.0,
                                  height: 12.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                          ? white
                                          : black)
                                          .withOpacity(
                                          _current.value == entry.key ? 0.9 : 0.4)),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {},
                                child: const Icon(Icons.favorite_border_rounded)
                                    .paddingAll(3)),
                            InkWell(
                                onTap: () {},
                                child: const Icon(Icons.share_outlined).paddingAll(3)),
                          ],
                        )
                      ],
                    ).paddingSymmetric(horizontal: 8),
                    Row(
                      children: [
                        textWidget(
                          text: "-${model.discountPercentage}%",
                          color: primary,
                          fontSize: 30,
                        ).paddingAll(8),
                        textWidget(
                            text:
                            "\$${(double.parse(model.price.toString()) - ((double.parse(model.price.toString()) * double.parse(model.discountPercentage.toString())) / 100)).toStringAsFixed(2)}",
                            fontSize: 30,
                            fontWeight: FontWeight.w500)
                            .paddingAll(8),
                      ],
                    ),
                    Row(
                      children: [
                        textWidget(text: "M.R.P.:").paddingOnly(left: 8, right: 4),
                        textWidget(
                            text: "\$ ${model.price}",
                            decoration: TextDecoration.lineThrough),
                      ],
                    ),
                    const Divider(),
                    textWidget(
                      text:
                      "Total: \$${(double.parse(model.price.toString()) - ((double.parse(model.price.toString()) * double.parse(model.discountPercentage.toString())) / 100)).toStringAsFixed(2)}",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ).paddingSymmetric(horizontal: 20, vertical: 6),
                    textWidget(
                      text: model.availabilityStatus.toString(),
                      color: primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ).paddingOnly(bottom: 6, left: 20),
                    const Divider(),
                    textWidget(
                        text: "Shipping Information: ${model.shippingInformation}")
                        .paddingSymmetric(horizontal: 20, vertical: 6),
                    const Divider(),
                    filledButton(
                        height: 45,
                        colorButton: primary,
                        onPressed: () {

                          cartController.addProductToCartApi(productId: model.productId.toString(), adminId: model.adminId.toString());

                          // if (productController.cartList.contains(model)) {
                          //   // model.quantity!.value = 1;
                          //   showToast(message: "Item already added in the cart");
                          // } else {
                          //   model.quantity!.value = 1;
                          //   productController.cartList.add(model);
                          //   showToast(message: "Item added to the cart");
                          // }
                        },
                        text: 'Add to Cart',
                        textColor: white)
                        .paddingSymmetric(horizontal: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: secondary,
                            size: 18,
                          ).paddingOnly(right: 6),
                          textWidget(
                            text: "secure transaction",
                            color: secondary,
                            fontSize: 16,
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 8, vertical: 10),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        returnPolicyWarranty(
                            widget: model.returnPolicy.toString() == "No return policy"
                                ? Image.asset(
                              "assets/icons/ic_no_return.png",
                              height: 25,
                            )
                                : Image.asset(
                              "assets/icons/ic_return.png",
                              height: 25,
                            ),
                            text: model.returnPolicy.toString()),
                        returnPolicyWarranty(
                            widget: model.warranty.toString() == "No warranty"
                                ? Image.asset(
                              "assets/icons/ic_no_guarantee.png",
                              height: 30,
                            )
                                : Image.asset(
                              "assets/icons/ic_guarantee.png",
                              height: 25,
                            ),
                            text: model.warranty.toString()),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          text: "Product Details",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16, vertical: 8),
                    expandedRow(title: "Top Highlights"),
                    expandedRow(title: "Product Specifications"),
                    expandedRow(title: "Product Images"),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        // Get.to(() => CustomerReviewsScreen(
                        //       model: model,
                        //     ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWidget(
                                text: "Customer Reviews",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  ratingStar(
                                      value: 4,
                                      // double.parse(model.rating.toString()),
                                      color: deepOrange)
                                      .paddingOnly(top: 10, bottom: 10, right: 10),
                                  // textWidget(text: "${model.rating} out of 5.0"),
                                  textWidget(text: "4 out of 5.0"),
                                ],
                              ),
                              textWidget(
                                  text: "${model.reviews?.length} Global ratings",
                                  color: secondary),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ).paddingSymmetric(horizontal: 16, vertical: 8),
                    ),
                    textWidget(
                      text: "Customers say",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ).paddingSymmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    textWidget(
                        text:
                        "Customers like the ease of use, quality and value of the beauty product. They mention that it's easy to use, has a powerful motor and is value for money.",
                        textAlign: TextAlign.justify)
                        .paddingOnly(right: 16, left: 16, bottom: 16),
                  ],
                )),
          ),
        ));
  }
}


