import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'InputField.dart';
import 'View.dart';

enum Role { Doctor, User }

class InputWarapper extends StatefulWidget {
  final Function(Role) onRoleChanged;

  InputWarapper({Key? key, required this.onRoleChanged}) : super(key: key);

  @override
  State<InputWarapper> createState() => _InputWarapperState();
}

class _InputWarapperState extends State<InputWarapper> {
  Role role = Role.Doctor;

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
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                ),
                InkWell(
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
                                    Container(
                                      height: 5.h,
                                      child: Image.asset(
                                        'assets/images/ClinicLogo.png',
                                        width: 40,
                                      ),
                                    ),
                                    Text('   Create a Doctor account:',
                                        style: TextStyle(
                                            fontFamily: 'font',
                                            color: Color(0xffFFBA5A),
                                            fontSize: 15.sp)),
                                  ],
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 54, vertical: 52),
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
              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    role = Role.User;
                    widget.onRoleChanged(role);
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
                    widget.onRoleChanged(role);
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
        ],
      ),
    );
  }
}
