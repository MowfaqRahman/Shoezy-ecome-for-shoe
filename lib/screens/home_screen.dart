import 'package:flutter/material.dart';
import '../widgets/brand_chip.dart';
import '../widgets/product_card.dart';

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
      'isFavorite': true,
    },
    {
      'id': 2,
      'image': 'assets/images/shoe2.png',
      'isFavorite': false,
    },
    {
      'id': 3,
      'image': 'assets/images/shoe3.png',
      'isFavorite': true,
    },
    {
      'id': 4,
      'image': 'assets/images/shoe4.png',
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
                Text(
                  'Our\nProducts',
                  style: TextStyle(
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
                    color: const Color(0xFFEAEAEA).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: const Icon(
                          Icons.search,
                          color: Colors.black54,
                          size: 24,
                        ),
                      ),
                      const Expanded(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'search shoe',
                              border: InputBorder.none,
                                                          hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontFamily: 'Sora',
                            ),
                            ),
                            style: TextStyle(
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
                      onFavoriteToggle: () {
                        setState(() {
                          products[index]['isFavorite'] = !products[index]['isFavorite'];
                        });
                      },
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