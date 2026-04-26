import 'package:flutter/material.dart';
import 'package:tars/core/widgets/remote_key.dart';

class MoveScreen extends StatelessWidget {
  const MoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.2),
            radius: 1.2,
            colors: [Color(0xFF111827), Color(0xFF020617)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- Top Tabs (Remote | Builder | Servo) ---
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _buildTab("REMOTE", isActive: true),
                      _buildTab("BUILDER"),
                      _buildTab("SERVO"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              _buildSectionTitle("MOVEMENT"),

              // --- Remote Control Panel ---
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white10),
                  color: Colors.white.withOpacity(0.02),
                ),
                child: Column(
                  children: [
                    // الـ D-Pad (الأسهم)
                    Column(
                      children: [
                        RemoteKey(icon: Icons.arrow_drop_up, onTap: () {}),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RemoteKey(icon: Icons.arrow_left, onTap: () {}),
                            const SizedBox(width: 10),
                            RemoteKey(icon: Icons.videocam_outlined, isCenter: true, onTap: () {}),
                            const SizedBox(width: 10),
                            RemoteKey(icon: Icons.arrow_right, onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: 10),
                        RemoteKey(icon: Icons.arrow_drop_down, onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // أزرار السرعة (Slow / Fast)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSpeedButton("SLOW", isActive: true, ontap: () {  }),
                        const SizedBox(width: 15),
                        _buildSpeedButton("FAST", isActive: false, ontap: () {  }),
                      ],
                    ),
                  ],
                ),
              ),

              _buildSectionTitle("EXECUTE"),

              // --- Execute Section ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Dropdown simulation
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Reset Position", style: TextStyle(color: Colors.white, fontSize: 16)),
                          Icon(Icons.keyboard_arrow_down, color: Colors.cyanAccent),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Run Button
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.cyanAccent.withOpacity(0.5)),
                        gradient: LinearGradient(colors: [Colors.cyanAccent.withOpacity(0.1), Colors.transparent]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.play_arrow, color: Colors.cyanAccent),
                          SizedBox(width: 10),
                          Text("RUN", style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, letterSpacing: 2)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجيت العناوين (Movement / Execute)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 10),
      child: Row(
        children: [
          Container(width: 3, height: 15, color: Colors.cyanAccent),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        ],
      ),
    );
  }

  // ويدجيت الـ Tabs اللي فوق
  Widget _buildTab(String label, {bool isActive = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF1E293B) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isActive ? Border.all(color: Colors.cyanAccent.withOpacity(0.3)) : null,
        ),
        child: Center(
          child: Text(label, style: TextStyle(color: isActive ? Colors.cyanAccent : Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  // ويدجيت أزرار السرعة
  Widget _buildSpeedButton(String label, {bool isActive = false,void Function()? ontap }) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isActive ? Colors.cyanAccent : Colors.white10),
          color: isActive ? Colors.cyanAccent.withOpacity(0.05) : Colors.transparent,
        ),
        child: Text(label, style: TextStyle(color: isActive ? Colors.cyanAccent : Colors.grey, fontWeight: FontWeight.bold)),
      ),
    );
  }
}