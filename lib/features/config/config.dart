import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // استخدام لون خلفية داكن ومتدرج كما في الصورة
      backgroundColor: const Color(0xFF0A0E21),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1D2671), Color(0xFF0A0E21)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // أيقونة الإعدادات الكبيرة المتوهجة
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 40,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.settings_rounded,
                      size: 80,
                      color: Color(0xFF46BAFC),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                // قسم معلومات التطبيق
                _buildSectionTitle("Application Info"),
                _buildSettingsGroup([
                  _buildSettingsTile(
                    icon: Icons.info_outline_rounded,
                    title: "TARS TM",
                    iconColor: Colors.cyan,
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.tag,
                    title: "Version 1.0.0",
                    iconColor: Colors.grey,
                    showTrailing: false,
                    onTap: () {},
                  ),
                ]),

                const SizedBox(height: 30),

                // قسم الشؤون القانونية
                _buildSectionTitle("Legal"),
                _buildSettingsGroup([
                  _buildSettingsTile(
                    icon: Icons.security_rounded,
                    title: "Privacy Policy",
                    iconColor: Colors.blueAccent,
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.description_rounded,
                    title: "Terms of Use",
                    iconColor: Colors.blue,
                    onTap: () {},
                  ),
                ]),
                
                const SizedBox(height: 100), // مساحة للـ NavBar في الأسفل
              ],
            ),
          ),
        ),
      ),
    );
  }

  // عنوان القسم (مثل Legal أو Application Info)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // حاوية المجموعة (البوكس الزجاجي الذي يضم العناصر)
  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(children: children),
    );
  }

  // العنصر الواحد داخل القائمة
  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required Color iconColor,
    required VoidCallback onTap,
    bool showTrailing = true,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (showTrailing)
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white.withOpacity(0.3),
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}