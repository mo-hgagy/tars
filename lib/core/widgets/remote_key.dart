import 'package:flutter/material.dart';

class RemoteKey extends StatelessWidget {
  final IconData? icon;
  final bool isCenter;
  final VoidCallback onTap;

  const RemoteKey({super.key, this.icon, this.isCenter = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B).withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isCenter ? Colors.cyanAccent : Colors.white10,
            width: isCenter ? 2 : 1,
          ),
          boxShadow: isCenter 
            ? [BoxShadow(color: Colors.cyanAccent.withOpacity(0.2), blurRadius: 8)] 
            : [],
        ),
        child: Icon(icon, color: Colors.cyanAccent, size: 30),
      ),
    );
  }
}