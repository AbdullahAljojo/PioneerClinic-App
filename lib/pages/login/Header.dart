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
      padding: const EdgeInsets.only(top: 62),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                'Welcom back',
                style: TextStyle(
                    fontFamily: 'font',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff002C42)),
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("L",
                      style: TextStyle(
                          fontFamily: 'font',
                          color: Color(0xff002C42),
                          fontSize: 22,
                          fontWeight: FontWeight.w400)),
                  Text("hiiii",
                      style: TextStyle(
                          fontFamily: 'font',
                          color: Color(0xff002C42),
                          fontSize: 22,
                          fontWeight: FontWeight.w400)),
                ],
              )),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 180.sp,
            child: Lottie.asset('assets/images/login.json'),
          ),
        ],
      ),
    );
  }
}
