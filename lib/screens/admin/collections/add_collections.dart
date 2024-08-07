
import 'package:ecommerce/bindings/main_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../widgets/widgets.dart';

class AddCollectionPage extends StatefulWidget {
  const AddCollectionPage({super.key});

  @override
  State<AddCollectionPage> createState() => _AddCollectionPageState();
}

class _AddCollectionPageState extends State<AddCollectionPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(text: "Add Collection",color: black,fontSize: 20,fontWeight: FontWeight.w500),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(text: "Title",color: black,fontSize: 20,fontWeight: FontWeight.w500),
          textTile(hintText: "Title", keyboardType: TextInputType.text, controller: controller).paddingSymmetric(vertical: 16),
          textWidget(text: "Description",color: black,fontSize: 20,fontWeight: FontWeight.w500),
          textTile(hintText: "Description", keyboardType: TextInputType.text, controller: controller,maxLines: 6).paddingSymmetric(vertical: 16),
          filledButton(height: 45, onPressed: (){}, text: "Add Collection", textColor: white, colorButton: primary).paddingOnly(top: 10)
        ],
      ).paddingAll(16),
    );
  }
}
