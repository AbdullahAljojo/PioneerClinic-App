import 'package:clinicmanagement/Screens/Homes/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../main.dart';
import 'View.dart';

class AppHeader extends StatefulWidget {
  AppHeader({Key? mykey}) : super(key: mykey);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  'Welcom back',
                  style: TextStyle(
                      fontFamily: 'font',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff002C42)),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 22.w),
                    child: Row(
                      children: [
                        Text("You are Login as",
                            style: TextStyle(
                                fontFamily: 'font',
                                color: Color(0xff002C42),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400)),
                      ],
                    )),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 40),
              alignment: Alignment.topCenter,
              height: 170.sp,
              child: Lottie.asset('assets/images/login.json',
                  fit: BoxFit.cover, width: 250.sp),
            ),
            Container(
              padding: const EdgeInsets.only(top: 65),
              alignment: Alignment.topCenter,
              height: 220.sp,
              child: Image.asset('assets/images/ClinicLogo2.png',
                  fit: BoxFit.contain, width: 140.sp),
            ),
          ],
        ),
      ),
    );
  }
}
