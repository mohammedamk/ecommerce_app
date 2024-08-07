import 'package:ecommerce/constants/controller_const.dart';
import 'package:ecommerce/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../widgets/widgets.dart';

class AddCollectionProductsPage extends StatefulWidget {
  final String collectionId;
  const AddCollectionProductsPage({super.key, required this.collectionId});

  @override
  State<AddCollectionProductsPage> createState() => _AddCollectionProductsPageState();
}

class _AddCollectionProductsPageState extends State<AddCollectionProductsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(text: "Add Collection Products",color: black,fontSize: 20,fontWeight: FontWeight.w500),
        forceMaterialTransparency: true,
      ),
      bottomNavigationBar:
      SizedBox(
        height: 40,
        width: double.infinity,
        child: FilledButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(primary),
              shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))))),
          onPressed: (){
            collectionsController.editButton(collectionId: widget.collectionId,isComingFromDetails: false);
          },
          child: Obx(()=>
              collectionsController.loading.value?showLoader(color: white):
              textWidget(
                text: "Add Products",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: white),
          ),

        ),
      ).paddingAll(16),
      body: Obx(()=>
          adminProductController.productList.isEmpty?
              noListFound(text: "No Products Available"):
          ListView.builder(
          shrinkWrap: true,
            itemCount: adminProductController.productList.length,
            itemBuilder: (context,index){
            var model = adminProductController.productList[index];
          return InkWell(
            onTap: (){
              if(model.isSelected!.value){
                model.setIsSelected = false.obs;
                collectionsController.selectedProductsIds.remove(model.id.toString());
                debugPrint(collectionsController.selectedProductsIds.toString());
              }else{
                model.setIsSelected = true.obs;
                if(!collectionsController.selectedProductsIds.contains(model.id.toString()) ){
                  collectionsController.selectedProductsIds.add(model.id.toString());
                }
                debugPrint(collectionsController.selectedProductsIds.toString());

              }
            },
            child: Card(
              color: white,
              elevation: 4,
              child: Row(
                children: [
                  Obx(()=> Checkbox(
                        side: BorderSide(color: primary,width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        activeColor: primary,
                        value: model.isSelected?.value, onChanged: (val){

                    }),
                  ),
                  networkImage(image: model.thumbnail.toString(), borderRadius: 12,height: 80,width: 100,boxFit: BoxFit.fill).paddingOnly(right: 10),
                  Expanded(child: textWidget(text: model.title??"",fontSize: 18,fontWeight: FontWeight.w500))
                ],
              ).paddingAll(8),
            ),
          ).paddingOnly(bottom: 8);
        }).paddingAll(16),
      ),
    );
  }
}
