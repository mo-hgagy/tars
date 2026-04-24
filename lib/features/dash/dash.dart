import 'package:flutter/material.dart';

void main() {
  runApp(const TarsApp());
}

class TarsApp extends StatelessWidget {
  const TarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedTab = 0;
  double maxNodes = 500;
  String timeWindow = "All time";

  final tabs = ["GRAPH", "MOOD", "LOG", "PROMPT", "SYS"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050B18),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Top Cards
            Row(
              children: [
                _buildTopCard("MEMORIES"),
                const SizedBox(width: 10),
                _buildTopCard("TOPICS"),
                const SizedBox(width: 10),
                _buildTopCard("INTERACTIONS"),
                const SizedBox(width: 10),
                _buildTopCard("MOOD"),
              ],
            ),

            const SizedBox(height: 20),

            /// Tabs
            Row(
              children: List.generate(tabs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedTab == index
                          ? const Color(0xFF0E2A47)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.cyanAccent),
                    ),
                    child: Text(
                      tabs[index],
                      style: const TextStyle(
                        color: Colors.cyanAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 15),

            /// Controls
            Row(
              children: [
                const Text(
                  "MAX NODES",
                  style: TextStyle(color: Colors.white70),
                ),
                Expanded(
                  child: Slider(
                    value: maxNodes,
                    min: 0,
                    max: 1000,
                    onChanged: (v) {
                      setState(() {
                        maxNodes = v;
                      });
                    },
                    activeColor: Colors.cyanAccent,
                  ),
                ),
                Text(
                  maxNodes.toInt().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 10),

                /// Dropdown
                DropdownButton<String>(
                  value: timeWindow,
                  dropdownColor: const Color(0xFF081426),
                  style: const TextStyle(color: Colors.white),
                  underline: Container(),
                  items: ["All time", "Last 24h", "Last week"]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      timeWindow = value!;
                    });
                  },
                )
              ],
            ),

            const SizedBox(height: 15),

            /// Content
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF081426),
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
                ),
                child: _buildContent(),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Dynamic Content based on Tab
  Widget _buildContent() {
    switch (selectedTab) {
      case 0:
        return _graphView();
      case 1:
        return _moodView();
      case 2:
        return _logView();
      case 3:
        return _promptView();
      case 4:
        return _sysView();
      default:
        return const SizedBox();
    }
  }

  Widget _graphView() {
    return Center(
      child: Text(
        "Graph View\nNodes: ${maxNodes.toInt()}\n$timeWindow",
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }

  Widget _moodView() {
    return const Center(
      child: Text("Mood Data", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _logView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, i) => ListTile(
        title: Text(
          "Log Entry $i",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _promptView() {
    return const Center(
      child: Text("Prompt Settings", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _sysView() {
    return const Center(
      child: Text("System Info", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildTopCard(String title) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$title clicked b")),
          );
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF081426),
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.cyanAccent,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}