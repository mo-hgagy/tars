import 'package:flutter/material.dart';

class NeumorphicButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NeumorphicButton({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1A2235), // لون الخلفية الغامق
              borderRadius: BorderRadius.circular(25),
              border: isSelected 
                  ? Border.all(color: Colors.cyanAccent, width: 2) 
                  : Border.all(color: Colors.white10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha :0.3),
                  blurRadius: 10,
                  offset: const Offset(5, 5),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.cyanAccent,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.cyanAccent : Colors.grey[400],
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}