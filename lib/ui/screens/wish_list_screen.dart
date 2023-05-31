import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/bottom_navigation_bar_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/wish_list_controller.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';
import 'package:get/get.dart';

import '../widgets/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WishListController>().getWishlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: greyColor,
          ),
        ),
      ),
      body: GetBuilder<WishListController>(builder: (wishListController) {
        if (wishListController.getWishListInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.75),
          itemCount: wishListController.wishListModel.data?.length ?? 0,
          itemBuilder: (context, index) {
            return ProductCard(
              product: wishListController.wishListModel.data![index].product!,
              onRemove: () {},
            );
          },
        );
      }),
    );
  }
}
