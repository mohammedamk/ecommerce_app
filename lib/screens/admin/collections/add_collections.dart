
import 'package:ecommerce/bindings/main_bindings.dart';
import 'package:ecommerce/constants/controller_const.dart';
import 'package:ecommerce/utils/app_utils.dart';
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
          textTile(hintText: "Title", keyboardType: TextInputType.text, controller: collectionsController.titleController).paddingSymmetric(vertical: 16),
          textWidget(text: "Description",color: black,fontSize: 20,fontWeight: FontWeight.w500),
          textTile(hintText: "Description", keyboardType: TextInputType.text, controller: collectionsController.descriptionController,maxLines: 6).paddingSymmetric(vertical: 16),
          Obx(()=> collectionsController.loading.value?showLoader():
               filledButton(height: 45, onPressed: collectionsController.addButton, text: "Add Collection", textColor: white, colorButton: primary).paddingOnly(top: 10))
        ],
      ).paddingAll(16),
    );
  }
}
