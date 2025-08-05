import 'package:flutter/material.dart';

class BrandChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BrandChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: isSelected 
            ? Border.all(color: const Color(0xFFF36721), width: 1)
            : null,
          boxShadow: isSelected 
            ? [
                BoxShadow(
                  color: const Color(0xFFF36721).withValues(alpha: 0.25),
                  blurRadius: 20.7,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: isSelected ? const Color(0xFF343434) : Colors.black,
          ),
        ),
      ),
    );
  }
}