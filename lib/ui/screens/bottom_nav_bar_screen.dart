import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/screens/cart_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/category_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/home_screen.dart';
import 'package:ostad_flutter_batch_two/ui/screens/wish_list_screen.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';

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

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _selectedIndex = value;
          if (mounted) {
            setState(() {});
          }
        },
        elevation: 5,
        selectedItemColor: primaryColor,
        unselectedItemColor: softGreyColor,
        currentIndex: _selectedIndex,
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
      ),
    );
  }
}
