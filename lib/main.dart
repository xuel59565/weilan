import 'package:flutter/material.dart';
import 'package:weilan/https/dio_instance.dart';

import 'app.dart';

void main() {
  //dio 初始化網絡請求框架
  DioInstance.instance().initDio(baseUrl: 'https://www.wanandroid.com/');
  runApp(const MyApp());
}
