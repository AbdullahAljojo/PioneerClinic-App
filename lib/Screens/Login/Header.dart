import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../main.dart';

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
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You are Login as",
                        style: TextStyle(
                            fontFamily: 'font',
                            color: Color(0xff002C42),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400)),
                    Text(" a Doctor",
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
              padding: EdgeInsets.only(top: 40),
              alignment: Alignment.topCenter,
              height: 170.sp,
              child: Lottie.asset('assets/images/login.json',
                  fit: BoxFit.cover, width: 250.sp),
            ),
          ],
        ),
      ),
    );
  }
}
