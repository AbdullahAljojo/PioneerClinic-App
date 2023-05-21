import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      margin: const EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        color: Color(0xffFFBA5A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
            fontFamily: 'font',
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
