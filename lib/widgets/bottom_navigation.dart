import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.search,
    title: 'Search',
  ),
  TabItem(
    icon: Icons.shopping_cart_outlined,
    title: 'Cart',
  ),
  TabItem(
    icon: Icons.favorite_border,
    title: 'Favorites',
  ),
];

class CustomBottomNavigation extends StatefulWidget {
  final Function(int)? onIndexChanged;
  final int currentIndex;

  const CustomBottomNavigation({
    super.key,
    this.onIndexChanged,
    required this.currentIndex,
  });

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cartService, child) {
        return BottomBarInspiredInside(
          items: items,
          backgroundColor: Colors.white,
          color: const Color(0xFFEBEBEB),
          colorSelected: Colors.white,
          indexSelected: widget.currentIndex,
          onTap: (int index) {
            widget.onIndexChanged?.call(index);
            // Handle navigation here
            switch (index) {
              case 0:
                // Home
                break;
              case 1:
                // Search
                break;
              case 2:
                // Cart
                break;
              case 3:
                // Favorites
                break;
            }
          },
          chipStyle: const ChipStyle(
            convexBridge: true,
            background: Color(0xFFF36721),
          ),
          itemStyle: ItemStyle.circle,
          animated: true,
        );
      },
    );
  }
}