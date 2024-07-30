import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 170.h,
            child: Swiper(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 150.h,
                  color: Colors.purple.withOpacity(0.2),
                  margin: EdgeInsets.all(10.r),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _listItemView();
              },
              itemCount: 10,
            ),
          )
        ],
      )),
    );
  }

  Widget _listItemView() {
    return Card(
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
                const Text(' 作者'),
                const Expanded(child: SizedBox()),
                Text(
                  '2024-07-30',
                  style: TextStyle(fontSize: 12.sp),
                ),
                const Text(
                  ' 置顶',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            const Text('文字内容文字内容文字内容文字内容文字内容'),
            Row(
              children: [
                Text(
                  '分类',
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
    );
  }
}
