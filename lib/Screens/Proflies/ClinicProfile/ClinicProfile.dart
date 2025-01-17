import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ClinicProfile extends StatelessWidget {
  ClinicProfile({super.key});

  double rating = 0;

  List status = [1, 2, 5, 4, 9, 13, 15, 20, 30, 40, 80];

  double radius = 27.0;

  double colorWidth(double radius, int statusCount, double separation) {
    return ((2 * pi * radius) - (statusCount * separation)) / statusCount;
  }

  double separation(int statusCount) {
    if (statusCount <= 20)
      return 3.0;
    else if (statusCount <= 30)
      return 1.8;
    else if (statusCount <= 60)
      return 1.0;
    else
      return 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('Home', (route) => false);
        }),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100.h,
              padding: EdgeInsets.only(right: 2.sp),
              child: Image.asset(
                'assets/images/ClinicLogo.png',
                width: 40,
              ),
            ),
            Text(
              'Clinic Profile',
              style: TextStyle(
                fontFamily: 'font',
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 40.sp,
            )
          ],
        ),
        toolbarHeight: 8.h,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: AnimationConfiguration.staggeredGrid(
          position: 1,
          duration: Duration(milliseconds: 475),
          columnCount: 2,
          child: ScaleAnimation(
              child: Stack(
            children: [
              Transform.translate(
                offset: Offset(-2.w, -5.h),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Positioned(
                          top: 9.h,
                          left: 30.w,
                          child: DottedBorder(
                            color: Color(0xff11CCC3),
                            borderType: BorderType.Circle,
                            radius: Radius.circular(radius),
                            dashPattern: status[4] == 1
                                ? [
                                    //one status
                                    (2 * pi * (radius + 2)),
                                    0,
                                  ]
                                : [
                                    //multiple status
                                    colorWidth(radius + 2, status[4],
                                        separation(status[4])),
                                    separation(status[4]),
                                  ],
                            strokeWidth: 3,
                            child: CircleAvatar(
                              radius: 65.sp,
                              backgroundColor: Colors.transparent,
                              child: CircleAvatar(
                                  radius: 63.sp,
                                  backgroundColor: Colors.black26,
                                  child: Image.asset(
                                    'assets/images/logotr.png',
                                    height: 60.sp,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Transform.translate(
                offset: Offset(2.w, 30.h),
                child: Column(
                  children: [
                    Text(
                      'Pioneer Clinic',
                      style: TextStyle(fontFamily: 'font', fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Text(
                      'example@gmail.com',
                      style: TextStyle(
                          fontFamily: 'font',
                          color: Colors.grey,
                          fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xff11CCC3),
                        ),
                        Text(
                          'Location',
                          style: TextStyle(fontFamily: 'font'),
                        ),
                      ],
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () async {
                          const address =
                              '1600 Amphitheatre Pkwy, Mountain View, CA 94043';
                          final url = Uri.parse(
                              'https://www.google.com/maps/place/%D8%AF%D9%85%D8%B4%D9%82%D8%8C+%D8%B3%D9%88%D8%B1%D9%8A%D8%A7%E2%80%AD/@33.5076527,36.4477125,11z/data=!3m1!4b1!4m6!3m5!1s0x1518e6dc413cc6a7:0x6b9f66ebd1e394f2!8m2!3d33.5138073!4d36.2765279!16zL20vMDJnanA');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Image.asset('assets/images/location.jpg'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
