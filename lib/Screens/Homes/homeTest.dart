import 'package:clinicmanagement/Screens/Setting/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

class HomeView extends StatelessWidget {
  final List<Image> images = [
    Image.asset('assets/images/2.jpg'),
    Image.asset('assets/images/1.jpg'),
    Image.asset('assets/images/4.jpg'),
    Image.asset('assets/images/3.jpg'),
  ];

  bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 6.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Dr.Mike',
                                style: TextStyle(
                                  letterSpacing: 0.4,
                                  fontFamily: 'font',
                                  fontSize: 24.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'find a way easily',
                                style: TextStyle(
                                  fontFamily: 'font',
                                  fontSize: 12.sp,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.sp, left: 37.w),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(const Duration(seconds: 4),
                                        () => Navigator.of(context).pop());
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Lottie.asset(
                                            'assets/images/loading.json',
                                            height: 80.sp,
                                            fit: BoxFit.cover),
                                      ],
                                    );
                                  }).whenComplete(() {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    'ClinicProfile', (route) => false);
                              });
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://image.shutterstock.com/image-photo/closeup-photo-amazing-short-hairdo-260nw-1617540484.jpg'),
                              radius: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.h,
                ),
                Container(
                  height: 220,
                  child: CarouselSlider.builder(
                    unlimitedMode: true,
                    slideBuilder: (index) {
                      return Container(
                          alignment: Alignment.center, child: images[index]);
                    },
                    slideTransform: CubeTransform(),
                    slideIndicator: CircularSlideIndicator(
                      currentIndicatorColor: Color(0xff11CCC3),
                      padding: EdgeInsets.only(bottom: 32),
                      indicatorBorderColor: Colors.grey,
                    ),
                    itemCount: images.length,
                    initialPage: 0,
                    enableAutoSlider: true,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2.h, left: 5.w),
                      height: 7.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20.sp,
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 15,
                            spreadRadius: 0.1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(
                              CupertinoIcons.search,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 45.w,
                              child: Text(
                                'search Customers',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'font',
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              height: 5.5.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xff11f999),
                                    Color(0xff11CCC3),
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Filter',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'font',
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.line_horizontal_3_decrease,
                                    size: 17.sp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 1.w,
                    right: 1.w,
                  ),
                  height: 12.h,
                  child: ListView.separated(
                    //physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (c, i) {
                      return AnimationConfiguration.staggeredGrid(
                        position: i,
                        duration: Duration(milliseconds: 375),
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: InkWell(
                              radius: 5.sp,
                              borderRadius: BorderRadius.circular(50.sp),
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 3.w,
                                  right: 3.w,
                                  top: 2.h,
                                  bottom: 2.h,
                                ),
                                padding: EdgeInsets.only(
                                  top: 1.5.h,
                                ),
                                width: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20.sp,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.10),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 3.w),
                                      height: 5.5.h,
                                      width: 14.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xff11CCC3),
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                      ),
                                      child: Icon(
                                        Icons.abc,
                                        color: Colors.white,
                                        size: 25.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Section',
                                            style: TextStyle(
                                              letterSpacing: 0.3.w,
                                              fontFamily: 'font',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '15 Booking',
                                            style: TextStyle(
                                              fontFamily: 'font',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9.sp,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 0.1.w,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 1.w,
                    right: 1.w,
                  ),
                  padding: EdgeInsets.only(
                    left: 1.w,
                    right: 1.w,
                  ),
                  height: 20.h,
                  child: GridView.count(
                    //physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: List.generate(
                      10,
                      (int index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(milliseconds: 375),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 3.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.sp),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.10),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 15.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(
                                            25.sp,
                                          ),
                                        ),
                                        color: Color(0xff11CCC3),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(0.w, -6.h),
                                      child: Image.asset(
                                        'assets/images/doctor.png',
                                        height: 20.h,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 3.w,
                                        bottom: 0.h,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 13.5.h,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Stack(
                                              children: [
                                                Transform.translate(
                                                  offset: Offset(30.w, -5.h),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xffFFBA5A),
                                                    child: Icon(
                                                      CupertinoIcons
                                                          .arrow_turn_left_up,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Dr Raghad Masri ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'font',
                                                  ),
                                                ),
                                                Transform.translate(
                                                  offset: Offset(0.w, 3.h),
                                                  child: Text(
                                                    'Category',
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'font',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
