import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:weilan/datas/home_data.dart';
import 'package:weilan/pages/home/home_vm.dart';
import 'package:weilan/route/route_utils.dart';
import 'package:weilan/route/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getBanner();
    viewModel.getHomeList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              _homeListView(),
            ],
          ),
        )),
      ),
    );
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return SizedBox(
        width: double.infinity,
        height: 220.h,
        child: Swiper(
          itemCount: vm.bannerList?.length ?? 0,
          autoplay: true,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 200.h,
              color: Colors.purple.withOpacity(0.2),
              margin: EdgeInsets.all(10.r),
              child: Image.network(
                '${vm.bannerList?[index].imagePath}',
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      );
    });
  }

  Widget _homeListView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: vm.listData?.length ?? 0,
        itemBuilder: (context, index) {
          return _listItemView(vm.listData?[index]);
        },
      );
    });
  }

  Widget _listItemView(HomeListItemData? item) {
    return GestureDetector(
      onTap: () {
        // RouteUtils.push(context, const WebViewPage());
        RouteUtils.pushForNamed(context, RoutePath.webViewPage,
            arguments: {"name": "路由传值"});
        // Navigator.pushNamed(context, RoutePath.webViewPage);
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(10.r, 4.r, 10.r, 4.r),
        child: Container(
          padding: EdgeInsets.all(10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90.r),
                    child: Image.network(
                      'https://hbimg.huabanimg.com/71143b799daf8f3f224f22d19953b02a74a69f5669ffb-NolluF_fw240webp',
                      height: 30.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(item?.author?.isEmpty == true
                      ? ' ${item?.shareUser}'
                      : ' ${item?.author}'),
                  const Expanded(child: SizedBox()),
                  Text(
                    '${item?.niceShareDate}',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  const Text(
                    ' 置顶',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text('${item?.title}'),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    '${item?.chapterName}',
                    style: TextStyle(color: Colors.green, fontSize: 12.sp),
                  ),
                  const Expanded(child: SizedBox()),
                  Image.asset(
                    'assets/images/img_collect_grey.png',
                    width: 20.r,
                    height: 20.r,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
