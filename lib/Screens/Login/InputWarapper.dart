import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'InputField.dart';
import 'View.dart';

class InputWarapper extends StatefulWidget {
  InputWarapper({Key? key}) : super(key: key);

  @override
  State<InputWarapper> createState() => _InputWarapperState();
}

class _InputWarapperState extends State<InputWarapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff11CCC3),
                borderRadius: BorderRadius.circular(10)),
            child: InputField(),
          ),
          const SizedBox(height: 20),
          Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'font',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Padding(
            padding: EdgeInsets.only(right: 18.w),
            child: Text(
              "Don't have an account? ",
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
