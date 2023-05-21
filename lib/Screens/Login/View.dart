import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Header.dart';
import 'InputWarapper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                AppHeader(),
                Container(
                  margin: EdgeInsets.only(top: 270.sp),
                  height: MediaQuery.of(context).size.height / 1.8,
                  decoration: BoxDecoration(
                      color: Color(0xff11CCC3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: const InputWarapper(),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
