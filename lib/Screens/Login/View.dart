import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'Header.dart';
import 'InputWarapper.dart';

enum Role { Doctor, User }

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
                Container(
                  margin: EdgeInsets.only(top: 270.sp),
                  height: MediaQuery.of(context).size.height / 1.8,
                  decoration: BoxDecoration(
                      color: Color(0xff11CCC3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: InputWarapper(),
                ),
                Positioned(
                  top: 92.h,
                  left: 38.w,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            role = Role.User;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: role == Role.Doctor
                                  ? Colors.black26
                                  : Color(0xffFFBA5A),
                              borderRadius: BorderRadius.circular(28)),
                          width: 48,
                          height: 48,
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            role = Role.Doctor;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: role == Role.User
                                  ? Colors.black26
                                  : Color(0xffFFBA5A),
                              borderRadius: BorderRadius.circular(28)),
                          width: 48,
                          height: 48,
                          child: Icon(
                            FontAwesomeIcons.userDoctor,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 85.9.h,
                  left: 58.w,
                  child: InkWell(
                    child: Text(
                      "SignUP",
                      style: TextStyle(
                        fontFamily: 'font',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFBA5A),
                      ),
                    ),
                    onTap: () {
                      role == Role.User
                          ? Navigator.of(context).pushNamedAndRemoveUntil(
                              'register', (route) => false)
                          : showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.stethoscope,
                                        color: Color(0xffFFBA5A),
                                      ),
                                      Text('   Create a Doctor account:',
                                          style: TextStyle(
                                              fontFamily: 'font',
                                              color: Color(0xffFFBA5A),
                                              fontSize: 15.sp)),
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 64, vertical: 52),
                                  children: [
                                    Text(
                                        '${"To create a doctor account, please visit our clinic to verify your credentials and qualifications. \n\nPlease bring your medical license and certificate(s) so we can validate and approve your doctor account."}',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'font',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.sp)),
                                    Lottie.asset('assets/images/createDoc.json',
                                        fit: BoxFit.cover, width: 250.sp),
                                  ],
                                );
                              });
                    },
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
