import 'package:flutter/material.dart';
import '../widgets/brand_chip.dart';
import '../widgets/product_card.dart';
import 'product_screen.dart'; // Import ProductScreen
import '../services/cart_service.dart'; // Import CartService
import 'package:provider/provider.dart'; // Import Provider for Consumer
import '../services/auth_service.dart'; // Import AuthService

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBrandIndex = 0;
  
  final List<String> brands = ['Nike', 'Adidas', 'Puma'];
  
  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'image': 'assets/images/shoe1.png',
      'name': 'Nike Air Max',
      'price': 129.99,
      'isFavorite': true,
    },
    {
      'id': 2,
      'image': 'assets/images/shoe2.png',
      'name': 'Adidas Ultraboost',
      'price': 149.99,
      'isFavorite': false,
    },
    {
      'id': 3,
      'image': 'assets/images/shoe3.png',
      'name': 'Puma RS-X',
      'price': 89.99,
      'isFavorite': true,
    },
    {
      'id': 4,
      'image': 'assets/images/shoe4.png',
      'name': 'New Balance 574',
      'price': 79.99,
      'isFavorite': false,
    },
  ];

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cart icon with item count
                    Consumer<CartService>(
                      builder: (context, cartService, child) {
                        return GestureDetector(
                          onTap: () {
                            // Navigate to cart screen
                            Navigator.pushNamed(context, '/cart');
                          },
                          child: Stack(
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
                                  Icons.shopping_cart_outlined,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                              if (cartService.itemCount > 0)
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF7F00),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 20,
                                      minHeight: 20,
                                    ),
                                    child: Text(
                                      '${cartService.itemCount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        // Logout button
                        GestureDetector(
                          onTap: () {
                            // Show logout confirmation dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: const Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  content: const Text(
                                    'Are you sure you want to logout?',
                                    style: TextStyle(
                                      fontFamily: 'Sora',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontFamily: 'Sora',
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        
                                        try {
                                          // Get the auth service and sign out
                                          final authService = Provider.of<AuthService>(context, listen: false);
                                          await authService.signOut();
                                          
                                          // Navigate to login screen
                                          Navigator.pushReplacementNamed(context, '/login');
                                        } catch (e) {
                                          // Show error message
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Logout failed: ${e.toString()}'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFFF7F00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: const Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontFamily: 'Sora',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
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
                              Icons.logout,
                              color: Colors.red,
                              size: 24,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Profile button
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
                  ],
                ),
                
                const SizedBox(height: 50),
                
                // Title
                Text(
                  'Our\nProducts',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: 1.2,
                    fontFamily: 'Sora',
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Search bar
                Container(
                  height: 53,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAEAEA).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                          size: 24,
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'search shoe',
                              border: InputBorder.none,
                              hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontFamily: 'Sora',
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Sora',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 49,
                        height: 46,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Brand categories
                SizedBox(
                  height: 55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: BrandChip(
                          label: brands[index],
                          isSelected: selectedBrandIndex == index,
                          onTap: () {
                            setState(() {
                              selectedBrandIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Product grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 172 / 197,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      imageUrl: product['image'],
                      isFavorite: product['isFavorite'],
                      productName: product['name'],
                      price: product['price'],
                      onFavoriteToggle: () {
                        setState(() {
                          products[index]['isFavorite'] = !products[index]['isFavorite'];
                        });
                      },
                      onTap: () {
                        // Navigate to product detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
                
                const SizedBox(height: 40), // Reduced from 100 to 40
              ],
            ),
          ),
        ),
      ),
    );
  }
}