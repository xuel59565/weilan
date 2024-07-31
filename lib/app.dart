import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:weilan/route/route_utils.dart';
import 'package:weilan/route/routes.dart';

import 'pages/home_page.dart';

Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  // 逻辑短边
  final logicalShortestSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  //逻辑长边
  final logicalLongestSide = firstView.physicalSize.longestSide /
      firstView.devicePixelRatio; //缩放比例 designsize越小，元素越大
  const scaleFactor = 0.95;
  // 缩放后的逻辑短边和长边
  return Size(
      logicalShortestSide * scaleFactor, logicalLongestSide * scaleFactor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: designSize,
        // minTextAdapt: true,
        // splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            navigatorKey: RouteUtils.navigatorKey,
            onGenerateRoute: Routes.generateRoute,
            initialRoute: RoutePath.home,
            // home: const HomePage(),
          );
        },
      ),
    );
  }
}
