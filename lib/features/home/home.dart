import 'package:flutter/material.dart';
import 'package:tars/core/widgets/neumorphic_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
      NeumorphicButton(icon: Icons.settings_rounded, label: 'setting', onTap: (){
        print("clicked");
      })
    ],)),);
  }
}