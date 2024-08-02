import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weilan/datas/home_banner_data.dart';
import 'package:weilan/datas/home_data.dart';
import 'package:weilan/https/dio_instance.dart';

class HomeViewModel with ChangeNotifier {
  List<BannerData>? bannerList;
  List<HomeListItemData>? listData;

  ///获取首页Banner数据
  Future getBanner() async {
    Response response = await DioInstance.instance().get(path: 'banner/json');

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
    Response response =
        await DioInstance.instance().get(path: 'article/list/0/json');
    HomeData homeData = HomeData.fromJson(response.data);
    if (homeData.data != null && homeData.data?.datas != null) {
      listData = homeData.data?.datas;
    } else {
      listData = [];
    }
    notifyListeners();
  }
}
