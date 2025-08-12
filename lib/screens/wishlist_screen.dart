import 'package:flutter/material.dart';
import '../models/wishlist_item.dart';
import '../widgets/product_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<WishlistItem> wishlistItems = [
    WishlistItem(
      id: 1,
      imagePath: 'assets/images/frame-9.png',
      name: 'Nike Air Max',
      price: 129.99,
    ),
    WishlistItem(
      id: 2,
      imagePath: 'assets/images/frame-11.png',
      name: 'Adidas Ultraboost',
      price: 149.99,
    ),
    WishlistItem(
      id: 3,
      imagePath: 'assets/images/frame-9-1.png',
      name: 'Puma RS-X',
      price: 89.99,
    ),
    WishlistItem(
      id: 4,
      imagePath: 'assets/images/frame-11-1.png',
      name: 'New Balance 574',
      price: 79.99,
    ),
    WishlistItem(
      id: 5,
      imagePath: 'assets/images/frame-12.png',
      name: 'Converse Chuck Taylor',
      price: 59.99,
    ),
    WishlistItem(
      id: 6,
      imagePath: 'assets/images/frame-13.png',
      name: 'Vans Old Skool',
      price: 69.99,
    ),
  ];

  void _removeFromWishlist(int itemId) {
    setState(() {
      wishlistItems.removeWhere((item) => item.id == itemId);
    });
  }

  void _toggleFavorite(int itemId) {
    setState(() {
      final item = wishlistItems.firstWhere((item) => item.id == itemId);
      final index = wishlistItems.indexOf(item);
      wishlistItems[index] = WishlistItem(
        id: item.id,
        imagePath: item.imagePath,
        name: item.name,
        price: item.price,
        isFavorite: !item.isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                // Header with profile button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 50),
                
                // Title
                const Text(
                  "My\nWishlist",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: 1.2,
                    fontFamily: 'Sora',
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Wishlist Items Grid
                if (wishlistItems.isEmpty)
                  const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Your wishlist is empty',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontFamily: 'Sora',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Add some products to your wishlist!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Sora',
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 172 / 220,
                    ),
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      final item = wishlistItems[index];
                      return Stack(
                        children: [
                          ProductCard(
                            imageUrl: item.imagePath,
                            isFavorite: item.isFavorite,
                            onFavoriteToggle: () => _toggleFavorite(item.id),
                          ),
                          // Remove button
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () => _removeFromWishlist(item.id),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.red.withValues(alpha: 0.9),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

