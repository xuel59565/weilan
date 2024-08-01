import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weilan/datas/home_banner_data.dart';
import 'package:weilan/datas/home_data.dart';

class HomeViewModel with ChangeNotifier {
  List<BannerData>? bannerList;
  List<HomeListItemData>? listData;
  Dio dio = Dio();

  void initDio() {
    dio.options = BaseOptions(
        method: 'get',
        baseUrl: 'https://www.wanandroid.com/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30));
  }

  ///获取首页Banner数据
  Future getBanner() async {
    Response response = await dio.get('banner/json');
    HomeBannerData bannerData = HomeBannerData.fromJson(response.data);
    if (bannerData.data != null) {
      bannerList = bannerData.data;
    } else {
      bannerList = [];
    }
    notifyListeners();
  }

  ///获取首页文章列表
  Future getHomeList() async {
    Response response = await dio.get('article/list/0/json');
    HomeData homeData = HomeData.fromJson(response.data);
    if (homeData.data != null && homeData.data?.datas != null) {
      listData = homeData.data?.datas;
    } else {
      listData = [];
    }
    notifyListeners();
  }
}
