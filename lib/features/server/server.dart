import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Server extends StatefulWidget {
  const Server({super.key});

  @override
  State<Server> createState() => _Server();
}

class _Server extends State<Server> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) 
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('http://10.114.13.21/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}