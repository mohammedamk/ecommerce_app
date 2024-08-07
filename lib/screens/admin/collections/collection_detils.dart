
import 'package:ecommerce/constants/controller_const.dart';
import 'package:ecommerce/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../widgets/widgets.dart';
import 'add_collection_products.dart';

class CollectionDetailsPage extends StatefulWidget {
  final String collectionId;
  const CollectionDetailsPage({super.key, required this.collectionId});

  @override
  State<CollectionDetailsPage> createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage> {


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_){
      apiCall();
    });
    super.initState();
  }

  Future<void> apiCall () async {
    await collectionsController.fetchCollectionDetailsApi(collectionId: widget.collectionId);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget(text: "Collection Details",color: black,fontSize: 20,fontWeight: FontWeight.w500),
        actions: [
          // SizedBox(height: 35,
          //     child: FilledButton(
          //       style: ButtonStyle(
          //           backgroundColor: WidgetStateProperty.all(primary),
          //           shape: WidgetStateProperty.all(const RoundedRectangleBorder(
          //               borderRadius: BorderRadius.all(Radius.circular(12))))),
          //       onPressed: (){},
          //       child: textWidget(
          //           text:  "Save",
          //           fontWeight: FontWeight.bold,
          //           fontSize: 14,
          //           color: white),
          //     ).paddingOnly(right: 10),),
          // textWidget(text: "Add Products",color: black,fontSize: 14,fontWeight: FontWeight.w400),
          Obx(()=>
              collectionsController.isEditMode.value?
              SizedBox(height: 35,
                child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(primary),
                      shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))))),
                  onPressed: (){
                    if(collectionsController.isEditMode.value){
                      collectionsController.editButton(collectionId: widget.collectionId,isComingFromDetails: true);
                    }else{
                      collectionsController.isEditMode(true);
                    }
                  },
                  child: Obx(()=>
                      collectionsController.loading.value?SizedBox(
                          height: 24,
                          child: showLoader(color: white)):
                      textWidget(
                        text:  "Save",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: white),
                  ),
                ).paddingOnly(right: 10),)
                  :
              Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              IconButton(onPressed:(){
                if(collectionsController.isEditMode.value){
                  collectionsController.isEditMode(false);
                }else{
                  collectionsController.isEditMode(true);
                }
              },icon:  Icon(Icons.edit_outlined,color: Colors.blue.shade700,)),
              IconButton(onPressed: (){
                collectionsController.deleteButton(collectionId: "1");
              },icon:  Icon(Icons.delete_outline,color: primary,))
            ],),
          )

        ],
      ),
      body: SingleChildScrollView(
        child: Obx(()=>
            collectionsController.loading.value?showLoader():
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(text: "Title",color: black,fontSize: 20,fontWeight: FontWeight.w500),
              Obx(()=>
                  textTile(hintText: "Title",readOnly: collectionsController.isEditMode.value?false:true, keyboardType: TextInputType.text, controller: collectionsController.titleController).paddingSymmetric(vertical: 16)),
              textWidget(text: "Description",color: black,fontSize: 20,fontWeight: FontWeight.w500),
              Obx(()=>textTile(hintText: "Description",readOnly: collectionsController.isEditMode.value?false:true, keyboardType: TextInputType.text, controller: collectionsController.descriptionController,maxLines: 6).paddingSymmetric(vertical: 16)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget(text: "Products",color: black,fontSize: 20,fontWeight: FontWeight.w500),

                  Obx(()=>
                      collectionsController.isEditMode.value && collectionsController.collectionProductList.isNotEmpty?
                      SizedBox(height: 35,
                        child: FilledButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(primary),
                              shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12))))),
                          onPressed: (){
                            Get.to(()=> AddCollectionProductsPage(collectionId: widget.collectionId,));
                          },
                          child: textWidget(
                              text:  "+ Add Products",
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: white),
                        ).paddingOnly(right: 10),):const SizedBox.shrink(),
                  ),

                ],
              ).paddingOnly(bottom: 16),
              Obx(()=>
                  collectionsController.collectionProductList.isEmpty?
                  InkWell(
                  onTap: () {
                    Get.to(() => AddCollectionProductsPage(collectionId: widget.collectionId));
                  },
                  child: SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: Card(
                      color: white,
                      elevation: 10,
                      child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add),
                              textWidget(
                                  text: "Add Products",
                                  color: black,
                                  textAlign: TextAlign.center,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ],
                          )),
                    ),
                  ),
                ).paddingSymmetric(vertical: 16):const SizedBox.shrink(),
              ),
              Obx(()=>
              collectionsController.collectionProductList.isEmpty?const SizedBox.shrink():
                  ListView.builder(
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: collectionsController.collectionProductList.length,
                    itemBuilder: (context,index){
                    var model =collectionsController.collectionProductList[index];
                  return Stack(
                    children: [
                      Card(
                        color: white,
                        elevation: 4,
                        child: Row(
                          children: [
                            networkImage(image: model.thumbnail??"", borderRadius: 12,height: 80,width: 100,boxFit: BoxFit.fill).paddingOnly(right: 10),
                            // ClipRRect(
                            //     borderRadius: BorderRadius.circular(12),
                            //     child: Image.asset(imgPlaceholder,height: 80,width:100,fit: BoxFit.fill,)).paddingOnly(right: 10),
                            Expanded(child: textWidget(text: model.title??"",fontSize: 18,fontWeight: FontWeight.w500))
                          ],
                        ).paddingAll(8),
                      ),
                      Obx(()=> collectionsController.isEditMode.value?
                        Positioned(
                          top: 6,
                          right: 6,
                          child: IconButton(onPressed: (){
                            collectionsController.deleteCollectionProductApi(collectionId: widget.collectionId, productId: model.id.toString(), index: index);
                          },icon:  Icon(Icons.delete_outline,color: primary,)),
                        ):const SizedBox.shrink(),
                      )
                    ],
                  );
                }),
              )
              // Obx(()=> collectionsController.loading.value?showLoader():
              // filledButton(height: 45, onPressed: collectionsController.addButton, text: "Add Collection", textColor: white, colorButton: primary).paddingOnly(top: 10))
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
