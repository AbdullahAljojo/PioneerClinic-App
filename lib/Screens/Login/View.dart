import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'Header.dart';
import 'InputWarapper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Role role = Role.Doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 55.sp,
                  left: 57.w,
                  child: Text(role == Role.Doctor ? " a Doctor" : " a User",
                      style: TextStyle(
                          fontFamily: 'font',
                          color: Color(0xff002C42),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400)),
                ),
                AppHeader(),
                AnimationConfiguration.staggeredGrid(
                    position: 1,
                    duration: Duration(milliseconds: 675),
                    columnCount: 2,
                    child: FlipAnimation(
                      child: FadeInAnimation(
                        child: Container(
                          margin: EdgeInsets.only(top: 270.sp),
                          height: MediaQuery.of(context).size.height / 1.7,
                          decoration: BoxDecoration(
                              color: Color(0xff11CCC3),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              )),
                          child: InputWarapper(
                            onRoleChanged: (Role newRole) {
                              setState(() {
                                role = newRole;
                              });
                            },
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
