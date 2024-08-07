import 'package:ecommerce/screens/dashboard/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../constants/styles.dart';


Widget noListFound({
  required String text,
}) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:
              titleLargeTextStyle(fontSize: 16, color: black),
        ),
      ],
    ),
  );
}


Widget textWidget({required String text, FontWeight? fontWeight,double?fontSize,Color?color,TextAlign?textAlign,TextDecoration?decoration,TextOverflow?overflow,int?maxLines}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow:overflow,
    maxLines: maxLines,
    style: titleLargeTextStyle(
      color: color??black,
      fontSize: fontSize??14,
      fontWeight: fontWeight ?? FontWeight.w400,
      decoration: decoration,

    ),
  );
}

Widget titleTextWidget({required String text, FontWeight? fontWeight,double?fontSize,Color?color,TextAlign?textAlign,TextDecoration?decoration,TextOverflow?overflow,int?maxLines}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow:overflow,
    maxLines: maxLines,
    style: titleLargeTextStyle(
      color: color??black,
      fontSize: fontSize??16,
      fontWeight: fontWeight ?? FontWeight.bold,
      decoration: decoration,

    ),
  );
}

Widget textOutlinedButton({required String text, required Function() onPressed}){
  return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              side:  BorderSide(color: liteBlack),
              borderRadius: BorderRadius.circular(12)))),
      child: Text(
        "Details",
        style: titleLargeTextStyle(
          color: black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ).paddingSymmetric(horizontal: 6, vertical: 2));
}

Widget filledButton({required double height,required Function() onPressed,required String text,required textColor,required Color colorButton}){
  return SizedBox(
    height: height,
    width: double.infinity,
    child: FilledButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colorButton),
          shape: WidgetStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))))),
      onPressed: onPressed,
      child: textWidget(
          text: text,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: textColor),

    ),
  );
}

Widget textTile({required String hintText,required TextInputType keyboardType,required TextEditingController controller,String?prefixImg,int?maxLines,bool?readOnly}){
  return TextFormField(
    keyboardType: keyboardType,
    controller: controller,
    minLines: 1,
    readOnly: readOnly??false,
    maxLines: maxLines??1,
    decoration: InputDecoration(
      prefixIcon: prefixImg==null?null:Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Image.asset(prefixImg,color: secondary,height: 24,width: 24,),
      ),

      fillColor: white,
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(8),
      //   borderSide: BorderSide(
      //     width: 1,
      //     color: Colors.grey.shade300,
      //     // style: BorderStyle.none,
      //   ),
      // ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: liteGrey,
          // style: BorderStyle.none,
        ),
      ),
      // filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),

    ),
  );
}

Widget dimensionTextTile({required String hintText,required TextInputType keyboardType,required TextEditingController controller}){
  return SizedBox(
    height: 45,
    child: TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(

        fillColor: white,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: liteGrey,
            // style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    ),
  );
}

Widget ratingStar({required double value,required Color color}){
  return RatingStars(
    starSpacing: 0,
    starCount: 5,
    value: value,
    starColor: color,
    maxValueVisibility: false,
    valueLabelVisibility: false,
  );
}


PreferredSizeWidget appBar({required String title}){
  return AppBar(
    title: textWidget(
        text: title, fontSize: 20, fontWeight: FontWeight.bold),
    centerTitle: true,
    forceMaterialTransparency: true,
  );
}


Widget reviewOrderAppBar({required String text,double?topSpace,double?bottomSpace,required bool isBack,Function()? onTap}){
  return isBack?
  Row(
    children: [
      InkWell(onTap: (){Get.back();}, child: const Icon(Icons.arrow_back)).paddingOnly(right: 16),
      textWidget(text: text, fontSize: 20,fontWeight: FontWeight.bold),
      const Spacer(),
      InkWell(onTap: onTap??(){Get.to(()=>const BottomNavBar());
      }, child: textWidget(text: "Cancel",fontSize: 16)).paddingOnly(right: 6)
    ],
  ).paddingOnly(top:topSpace??40,bottom: bottomSpace??16):
  Center(child: textWidget(text: text, fontSize: 20,fontWeight: FontWeight.bold)).paddingOnly(top:topSpace??40,bottom: bottomSpace??16);
}

Widget commonAppBar({required String text,double?topSpace,double?bottomSpace,required bool isBack}){
  return isBack?
    Row(
      children: [
        IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back)),
        const Spacer(),
        textWidget(text: text, fontSize: 20,fontWeight: FontWeight.bold).paddingOnly(right: 45),
        const Spacer(),
      ],
    ).paddingOnly(top:topSpace??40,bottom: bottomSpace??16):
    Center(child: textWidget(text: text, fontSize: 20,fontWeight: FontWeight.bold)).paddingOnly(top:topSpace??40,bottom: bottomSpace??16);
}
Widget commonAppBarTwo({required String text,double?topSpace,double?bottomSpace}){
  return Row(
    children: [
      IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back)),
      const Spacer(),
      textWidget(text: text, fontSize: 20,fontWeight: FontWeight.bold).paddingOnly(right: 45),
      const Spacer(),
    ],
  ).paddingOnly(top:topSpace??40,bottom: bottomSpace??16);
}

Widget backgroundContainer({required Widget child}){
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/3dbg.jpg"),
            fit: BoxFit.cover,
            opacity: 0.4)),
    child: child,
  );
}


Widget networkImage(
    {required String image,
      required double borderRadius,
      double? height,
      double? width,
      BoxFit? boxFit}) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(image, height: height, width: width, fit: boxFit,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
            child:
            SizedBox(
              width: height,
              height: width,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.white,
                child: Image.asset(imgPlaceholder,
            height: height, width: width, fit: boxFit)))
            );
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset(imgPlaceholder,
                height: height, width: width, fit: boxFit);
          }));
}