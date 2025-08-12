import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/checkout_form.dart';
import '../services/cart_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _showCheckoutForm = false;

  void _showCheckout() {
    setState(() {
      _showCheckoutForm = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cartService, child) {
        final cartItems = cartService.cartItems;
        
        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: Stack(
            children: [
              // Main Content - Now scrollable
              SafeArea(
                child: SingleChildScrollView(
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
                                    color: Colors.black.withValues(alpha: 0.1),
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

                      // Cart Items - Now part of the main scroll
                      if (cartItems.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Your cart is empty',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontFamily: 'Sora',
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Add some products to your cart!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'Sora',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        ...cartItems.map((item) => CartItemCard(
                          item: item,
                          onDelete: () => cartService.removeFromCart(item.id),
                          onQuantityChanged: (newQuantity) => cartService.updateQuantity(item.id, newQuantity),
                        )).toList(),

                      // Separator
                      if (cartItems.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                          height: 3,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6E6E6E),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),

                      // Total Section
                      if (cartItems.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              _buildTotalRow('Total', cartService.subtotal, isSubtotal: true),
                              _buildTotalRow('Shipping', cartService.shipping),
                              const SizedBox(height: 8),
                              _buildTotalRow('Grand Total', cartService.grandTotal, isGrandTotal: true),
                            ],
                          ),
                        ),

                      // Checkout Button
                      if (cartItems.isNotEmpty)
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

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              // Checkout Form Overlay
              if (_showCheckoutForm)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.5),
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
                                onPressed: () {
                                  setState(() {
                                    _showCheckoutForm = false;
                                  });
                                },
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
      },
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