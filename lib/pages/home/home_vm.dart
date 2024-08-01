import 'package:dio/dio.dart';
import 'package:weilan/datas/home_banner_data.dart';

class HomeViewModel {
  static Future<List<BannerData>?> getBanner() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
        method: 'get',
        baseUrl: 'https://www.wanandroid.com/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30));
    Response response = await dio.get('banner/json');
    HomeBannerData bannerData = HomeBannerData.fromJson(response.data);
    if (bannerData.data != null) {
      return bannerData.data;
    }
    return [];
  }
}
