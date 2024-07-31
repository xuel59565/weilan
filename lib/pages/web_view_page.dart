import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebViewPage')),
      body: SafeArea(child: Container()),
    );
  }
}
