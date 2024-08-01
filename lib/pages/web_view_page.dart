import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//组件初始化完成后获取路由传值
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var map = ModalRoute.of(context)?.settings.arguments;
      if (map is Map) {
        name = map['name'];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SafeArea(child: Container()),
    );
  }
}
