import 'package:flutter/material.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({super.key});

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Header
          Column(
            children: [
              const Text(
                'Get Started',
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your details below',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Color(0xFF808080),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Form Fields
          _buildFormField(
            controller: _mobileController,
            placeholder: 'Mobile Number',
            isPassword: false,
          ),
          
          const SizedBox(height: 20),
          
          _buildFormField(
            controller: _passwordController,
            placeholder: 'Password',
            isPassword: true,
            showPassword: _showPassword,
            onTogglePassword: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
          
          const SizedBox(height: 20),
          
          _buildFormField(
            controller: _confirmPasswordController,
            placeholder: 'Confirm Password',
            isPassword: true,
            showPassword: _showConfirmPassword,
            onTogglePassword: () {
              setState(() {
                _showConfirmPassword = !_showConfirmPassword;
              });
            },
          ),
          
          const SizedBox(height: 24),
          
          // Sign Up Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Handle sign up
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7F00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Or continue with
          Row(
            children: [
              Expanded(child: Container(height: 1, color: Colors.grey[400])),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Or continue with',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Color(0xFFFBFBFB),
                  ),
                ),
              ),
              Expanded(child: Container(height: 1, color: Colors.grey[400])),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Social Login Buttons
          Row(
            children: [
              Expanded(
                child: _buildSocialButton('assets/images/google.png'),
              ),
              const SizedBox(width: 27),
              Expanded(
                child: _buildSocialButton('assets/images/apple.png'),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Sign In Link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account ? ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle sign in
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 14,
                    color: Color(0xFFFBFBFB),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String placeholder,
    required bool isPassword,
    bool showPassword = false,
    VoidCallback? onTogglePassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x26636363),
        border: Border.all(color: const Color(0xFF636363), width: 1.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !showPassword,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: Color(0xFF636363),
        ),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Color(0xFF636363),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onTogglePassword,
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF636363),
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildSocialButton(String iconPath) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF232323)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.login, color: Colors.grey);
          },
        ),
      ),
    );
  }
}