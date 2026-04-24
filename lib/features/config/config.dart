import 'package:flutter/material.dart';
import 'package:tars/core/widgets/neumorphic_button.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617), // خلفية داكنة جداً
      body: Container(
        decoration: const BoxDecoration(
          // إضافة تأثير إضاءة خفيف في الخلفية
          gradient: RadialGradient(
            center: Alignment(0, -0.5),
            radius: 1.5,
            colors: [Color(0xFF1E293B), Color(0xFF020617)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- Header Section (Top Bar) ---
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Icon(Icons.settings, color: Colors.cyanAccent),
                    const SizedBox(width: 10),
                    const Text("CONFIG", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2)),
                    const Spacer(),
                    _buildTopButton(Icons.save_alt, "SAVE"),
                    const SizedBox(width: 10),
                    _buildTopButton(Icons.refresh, "REBOOT"),
                  ],
                ),
              ),

              // --- Grid Section ---
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  crossAxisCount: 4,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 15,
                  children: [
                    NeumorphicButton(icon: Icons.person, label: "System", onTap: () {}),
                    NeumorphicButton(icon: Icons.smart_toy, label: "AI Model", onTap: () {}),
                    NeumorphicButton(icon: Icons.bolt, label: "Skills", onTap: () {}),
                    NeumorphicButton(icon: Icons.mic, label: "Speech", onTap: () {}),
                    NeumorphicButton(icon: Icons.volume_up, label: "Voice", onTap: () {}),
                    NeumorphicButton(icon: Icons.sentiment_satisfied, label: "Emotion", onTap: () {}),
                    NeumorphicButton(icon: Icons.visibility, label: "Vision", onTap: () {}),
                    NeumorphicButton(icon: Icons.storage, label: "Memory", onTap: () {}),
                    NeumorphicButton(icon: Icons.tv, label: "Display", onTap: () {}),
                    NeumorphicButton(icon: Icons.vpn_key, label: "Access", onTap: () {}),
                    NeumorphicButton(icon: Icons.wifi, label: "WiFi", onTap: () {}),
                    NeumorphicButton(icon: Icons.videogame_asset, label: "Controls", isSelected: true, onTap: () {}),
                    NeumorphicButton(icon: Icons.battery_3_bar, label: "battery", isSelected: true, onTap: () {}),
                  ],
                ),
              ),

              // --- Bottom Info Panel ---
              _buildInfoPanel(),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجيت للأزرار اللي فوق (Save/Reboot)
  Widget _buildTopButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.cyanAccent, size: 16),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(color: Colors.cyanAccent, fontSize: 12)),
        ],
      ),
    );
  }

  // اللوحة السفلية اللي فيها شرح "Controls"
  Widget _buildInfoPanel() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.arrow_back_ios, color: Colors.cyanAccent, size: 16),
              const SizedBox(width: 10),
              const Icon(Icons.videogame_asset, color: Colors.cyanAccent),
              const SizedBox(width: 10),
              const Text("Controls", style: TextStyle(color: Colors.cyanAccent, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "Connect a Bluetooth or USB game controller to physically steer TARS around.",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}