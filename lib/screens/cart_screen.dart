import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/checkout_form.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      id: '1',
      name: 'item1',
      price: 108.00,
      image: 'assets/images/frame-14.png',
      size: 'S',
      color: 'Blue',
    ),
    CartItem(
      id: '2',
      name: 'item1',
      price: 108.00,
      image: 'assets/images/frame-14-1.png',
      size: 'S',
      color: 'Blue',
    ),
    CartItem(
      id: '3',
      name: 'item1',
      price: 108.00,
      image: 'assets/images/frame-14-2.png',
      size: 'S',
      color: 'Blue',
    ),
  ];

  bool _showCheckoutForm = false;

  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  double get shipping => 0.0;
  double get grandTotal => subtotal + shipping;

  void _removeItem(String itemId) {
    setState(() {
      cartItems.removeWhere((item) => item.id == itemId);
    });
  }

  void _showCheckout() {
    setState(() {
      _showCheckoutForm = true;
    });
  }

  void _hideCheckout() {
    setState(() {
      _showCheckoutForm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Header with Profile Icon
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
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
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
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
                ),

                // Title
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 40,
                        height: 1.35,
                        letterSpacing: 0.30,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Shipping\n',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: 'Cart',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),

                // Cart Items
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItemCard(
                        item: item,
                        onDelete: () => _removeItem(item.id),
                      );
                    },
                  ),
                ),

                // Separator
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                  height: 3,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6E6E6E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                // Total Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _buildTotalRow('Total', subtotal, isSubtotal: true),
                      _buildTotalRow('Shipping', shipping),
                      const SizedBox(height: 8),
                      _buildTotalRow('Grand Total', grandTotal, isGrandTotal: true),
                    ],
                  ),
                ),

                // Checkout Button
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _showCheckout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7F00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 89), // Space for bottom navigation
              ],
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 89,
              decoration: BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 11.1,
                offset: const Offset(0, 0),
              ).color != null ? null : BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 11.1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Background
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 67,
                      color: Colors.white,
                    ),
                  ),

                  // Center Cart Button
                  Positioned(
                    top: 0,
                    left: MediaQuery.of(context).size.width / 2 - 49,
                    child: Container(
                      width: 98,
                      height: 82,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          // Background circle
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 98,
                              height: 82,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(49),
                              ),
                            ),
                          ),
                          // Cart icon
                          Positioned(
                            top: 9,
                            left: 25,
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF36721),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Checkout Form Overlay
          if (_showCheckoutForm)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Stack(
                      children: [
                        // Close button
                        Positioned(
                          top: 16,
                          right: 16,
                          child: IconButton(
                            onPressed: _hideCheckout,
                            icon: const Icon(Icons.close),
                          ),
                        ),
                        // Form content
                        const Positioned.fill(
                          child: CheckoutForm(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount, {bool isSubtotal = false, bool isGrandTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: isGrandTotal ? 'Poppins' : 'Poppins',
              fontSize: 18,
              fontWeight: isGrandTotal ? FontWeight.w500 : FontWeight.w500,
              color: isGrandTotal ? Colors.black : const Color(0xFF8E8E8E),
            ),
          ),
          Text(
            '₹${amount.toStringAsFixed(1)}',
            style: TextStyle(
              fontFamily: 'Sora',
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: isGrandTotal ? Colors.black : const Color(0xFF8E8E8E),
            ),
          ),
        ],
      ),
    );
  }
}