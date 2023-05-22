import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_card.dart';
import 'package:get/get.dart';

import '../state_managers/product_controller.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;

  const ProductListScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getProductsByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: GetBuilder<ProductController>(builder: (productController) {
        if (productController.getProductsByCategoryInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.75),
          itemCount:
              productController.productByCategoryModel.products?.length ?? 0,
          itemBuilder: (context, index) {
            return ProductCard(
              product:
                  productController.productByCategoryModel.products![index],
            );
          },
        );
      }),
    );
  }
}
