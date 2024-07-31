import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/web_view_page.dart';
///路由管理
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(const HomePage(),settings:settings);
      case RoutePath.webViewPage:
        return pageRoute(const WebViewPage(),settings:settings);
      // default:
      //   return pageRoute(const HomePage());
    }
    return pageRoute(  Scaffold(
      body: Center(child: Text('路由：${settings.name}不存在')),
    ));

  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
      maintainState: maintainState ?? true,
      fullscreenDialog: fullscreenDialog ?? false,
      allowSnapshotting: allowSnapshotting ?? true,
    );
  }
}

//路由地址
class RoutePath {
  //首页
  static const String home = '/ ';
  static const String webViewPage = '/web_view_page';
}
