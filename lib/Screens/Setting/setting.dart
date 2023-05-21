import 'package:clinicmanagement/components.dart/background.dart';
import 'package:clinicmanagement/Screens/Setting/settingCubit.dart';
import 'package:clinicmanagement/Screens/Setting/settingStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late int _radioValue;
  @override
  void initState() {
    super.initState();
    _radioValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Lottie.asset('assets/images/setting.json'),
          ),
          AnimationConfiguration.staggeredGrid(
              position: 1,
              duration: Duration(milliseconds: 375),
              columnCount: 2,
              child: ScaleAnimation(
                  child: FadeInAnimation(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 40),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Select Theme'),
                                  content: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Radio(
                                            activeColor: Color(0xff11CCC3),
                                            value: 0,
                                            groupValue: _radioValue,
                                            onChanged: (value) => setState(() {
                                              SettingCubit.get(context)
                                                  .changeMode();
                                            }),
                                          ),
                                          SizedBox(
                                            width: 8.sp,
                                          ),
                                          Text(
                                            'Light',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'font'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 9.sp,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                            activeColor: Color(0xff11CCC3),
                                            value: 1,
                                            groupValue: _radioValue,
                                            onChanged: (value) => setState(() {
                                              SettingCubit.get(context)
                                                  .changeMode();
                                            }),
                                          ),
                                          SizedBox(
                                            width: 8.sp,
                                          ),
                                          Text(
                                            'Dark',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'font'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Text(
                                        'System Default',
                                        style: TextStyle(fontFamily: 'font'),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Color(0xff11CCC3),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: SizedBox(
                          width: 120.0.sp,
                          height: 120.0.sp,
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.brightness_4_outlined,
                                    color: Color(0xff11CCC3),
                                  ),
                                  SizedBox(
                                    height: 12.0.sp,
                                  ),
                                  Text(
                                    "Select Theme",
                                    style: TextStyle(
                                        fontFamily: 'font',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0.sp),
                                  ),
                                  SizedBox(
                                    height: 5.0.sp,
                                  ),
                                  Text(
                                    "Choose Your app \n theme",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: 'font',
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.5, left: 225.0),
                      child: InkWell(
                        onTap: () {
                          ///////////////////
                        },
                        child: SizedBox(
                          width: 120.0.sp,
                          height: 120.0.sp,
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.language,
                                    color: Color(0xff11CCC3),
                                  ),
                                  SizedBox(
                                    height: 15.0.sp,
                                  ),
                                  Text(
                                    "Language",
                                    style: TextStyle(
                                        fontFamily: 'font',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0.sp),
                                  ),
                                  SizedBox(
                                    height: 7.0.sp,
                                  ),
                                  Text(
                                    "English",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: 'font',
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200.5, left: 40.0),
                      child: InkWell(
                        onTap: () {
                          sharedPref?.setBool('isAuthorized', false);
                          sharedPref?.setString('role', 'User');
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(const Duration(seconds: 2),
                                    () => Navigator.of(context).pop());
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Lottie.asset('assets/images/loading.json',
                                        height: 20.h),
                                    Text(
                                      "Signing out..",
                                      style: TextStyle(
                                          fontSize: 21.sp,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'font',
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                  ],
                                );
                              }).whenComplete(() {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                'Login', (route) => false);
                          });
                        },
                        child: SizedBox(
                          width: 120.0.sp,
                          height: 120.0.sp,
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.settings_power_outlined,
                                    color: Color(0xff11CCC3),
                                  ),
                                  SizedBox(
                                    height: 15.0.sp,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                        fontFamily: 'font',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0.sp),
                                  ),
                                  SizedBox(
                                    height: 7.0.sp,
                                  ),
                                  Text(
                                    "Thanks for visiting",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: 'font',
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
