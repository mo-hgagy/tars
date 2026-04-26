import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.bar_chart_rounded, 'label': 'Server'},
    {'icon': Icons.settings_rounded, 'label': 'Settings'},
  ];

  double _dragOffset = 0.0;
  bool _isDragging = false;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.92,
      upperBound: 1.0,
      value: 1.0,
    );
    _scaleAnimation = CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double barHeight = 75;
    const double internalPadding = 6.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double usableWidth = constraints.maxWidth - (internalPadding * 2);
            final double itemWidth = usableWidth / items.length;

            if (!_isDragging) {
              _dragOffset = widget.selectedIndex * itemWidth;
            }

            return GestureDetector(
              onHorizontalDragStart: (_) {
                HapticFeedback.selectionClick();
                setState(() => _isDragging = true);
              },
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragOffset += details.delta.dx;
                  _dragOffset = _dragOffset.clamp(0.0, usableWidth - itemWidth);
                });
              },
              onHorizontalDragEnd: (_) {
                int newIndex = (_dragOffset / itemWidth).round();
                newIndex = newIndex.clamp(0, items.length - 1);
                setState(() => _isDragging = false);
                widget.onItemTapped(newIndex);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    height: barHeight,
                    padding: const EdgeInsets.all(internalPadding),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: _isDragging ? 40 : 300),
                          curve: Curves.easeOutCubic,
                          left: _dragOffset,
                          top: 0,
                          bottom: 0,
                          width: itemWidth,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                        Row(
                          children: List.generate(items.length, (index) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  _scaleController.reverse().then((_) => _scaleController.forward());
                                  widget.onItemTapped(index);
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(items[index]['icon'], color: const Color(0xFF1A1C2E), size: 28),
                                    const SizedBox(height: 2),
                                    Text(items[index]['label'], 
                                      style: const TextStyle(color: Color(0xFF1A1C2E), fontSize: 10, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}