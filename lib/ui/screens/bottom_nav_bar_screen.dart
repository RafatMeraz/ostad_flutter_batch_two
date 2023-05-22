import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/ui/screens/cart_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/category_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/home_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/wish_list_screen.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/bottom_navigation_bar_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/category_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/home_controller.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';

import '../state_managers/product_by_remark_controller.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getHomeSlider();
    Get.find<CategoryController>().getCategories();
    Get.find<ProductByRemarkController>().getPopularProductsByRemark();
    Get.find<ProductByRemarkController>().getNewProductsByRemark();
    Get.find<ProductByRemarkController>().getSpecialProductsByRemark();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return _screens[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            onTap: (value) {
              controller.changeIndex(value);
            },
            elevation: 5,
            selectedItemColor: primaryColor,
            unselectedItemColor: softGreyColor,
            currentIndex: controller.selectedIndex,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: 'Categories'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Wishlist'
              ),
            ],
          );
        }
      ),
    );
  }
}
