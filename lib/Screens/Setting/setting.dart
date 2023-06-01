import 'package:clinicmanagement/Screens/Setting/settingCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../Components.dart/cachHelper.dart';
import '../../main.dart';

enum Theme {
  Dark,
  Light,
}

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

  Theme theme = Theme.Light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: SettingCubit.get(context).isDark
                  ? Colors.black45
                  : Color(0xffF0EFF5),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 40.0.h),
              child: Lottie.asset('assets/images/setting.json'),
            ),
          ),
          AnimationConfiguration.staggeredGrid(
              position: 1,
              duration: Duration(milliseconds: 375),
              columnCount: 2,
              child: FadeInAnimation(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 40),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 20,
                              backgroundColor: SettingCubit.get(context).isDark
                                  ? Colors.black45
                                  : Color(0xffF0EFF5),
                              content: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color:
                                              SettingCubit.get(context).isDark
                                                  ? Color(0xffFFBA5A)
                                                  : Color(0xff11CCC3),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Select Theme',
                                            style: TextStyle(
                                              fontFamily: 'font',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.xmark,
                                              )),
                                        ],
                                      )),
                                  Row(children: [
                                    Radio<Theme>(
                                      value: Theme.Light,
                                      groupValue: theme,
                                      activeColor:
                                          SettingCubit.get(context).isDark
                                              ? Colors.white
                                              : Color(0xff11CCC3),
                                      onChanged: (Theme? value) {
                                        setState(() {
                                          theme = value!;
                                        });
                                        SettingCubit.get(context).changeMode();
                                      },
                                    ),
                                    Text(
                                      "Light",
                                      style: theme == Theme.Light
                                          ? TextStyle(
                                              fontFamily: 'font',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff11CCC3),
                                              fontSize: 13.sp)
                                          : TextStyle(
                                              fontFamily: 'font',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp),
                                    )
                                  ]),
                                  Row(children: [
                                    Radio<Theme>(
                                      value: Theme.Dark,
                                      groupValue: theme,
                                      activeColor: Color(0xffFFBA5A),
                                      onChanged: (Theme? value) {
                                        setState(() {
                                          theme = value!;
                                        });
                                        SettingCubit.get(context).changeMode();
                                      },
                                    ),
                                    Text(
                                      "Dark   ",
                                      style: theme == Theme.Dark
                                          ? TextStyle(
                                              fontFamily: 'font',
                                              color: Color(0xffFFBA5A),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.sp)
                                          : TextStyle(
                                              fontFamily: 'font',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  Text(
                                    'System Default',
                                    style: TextStyle(
                                      fontFamily: 'font',
                                      color: SettingCubit.get(context).isDark
                                          ? Color(0xffFFBA5A)
                                          : Color(0xff11CCC3),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: SizedBox(
                      width: 120.0.sp,
                      height: 120.0.sp,
                      child: Card(
                        color: SettingCubit.get(context).isDark
                            ? Colors.grey
                            : Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.sp,
                              ),
                              Icon(
                                FontAwesomeIcons.circleHalfStroke,
                                color: SettingCubit.get(context).isDark
                                    ? Color(0xffFFBA5A)
                                    : Color(0xff11CCC3),
                              ),
                              SizedBox(
                                height: 12.0.sp,
                              ),
                              Text(
                                "Select Theme",
                                style: TextStyle(
                                    fontFamily: 'font',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0.sp,
                                    color: SettingCubit.get(context).isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              SizedBox(
                                height: 5.0.sp,
                              ),
                              Text(
                                "Choose Your app \n theme",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: 'font',
                                    fontWeight: FontWeight.w100,
                                    color: SettingCubit.get(context).isDark
                                        ? Colors.white
                                        : Colors.black),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              )),
          AnimationConfiguration.staggeredGrid(
              position: 1,
              duration: Duration(milliseconds: 375),
              columnCount: 2,
              child: FadeInAnimation(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.5, left: 225.0),
                  child: InkWell(
                    onTap: () {
                      ///////////////////
                    },
                    child: SizedBox(
                      width: 120.0.sp,
                      height: 120.0.sp,
                      child: Card(
                        color: SettingCubit.get(context).isDark
                            ? Colors.grey
                            : Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.sp,
                              ),
                              Icon(
                                FontAwesomeIcons.earthEurope,
                                color: SettingCubit.get(context).isDark
                                    ? Color(0xffFFBA5A)
                                    : Color(0xff11CCC3),
                              ),
                              SizedBox(
                                height: 15.0.sp,
                              ),
                              Text(
                                "Language",
                                style: TextStyle(
                                    fontFamily: 'font',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0.sp,
                                    color: SettingCubit.get(context).isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              SizedBox(
                                height: 7.0.sp,
                              ),
                              Text(
                                "English",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: 'font',
                                    fontWeight: FontWeight.w100,
                                    color: SettingCubit.get(context).isDark
                                        ? Colors.white
                                        : Colors.black),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              )),
          AnimationConfiguration.staggeredGrid(
            position: 1,
            duration: Duration(milliseconds: 375),
            columnCount: 2,
            child: FadeInAnimation(
              child: Padding(
                  padding: const EdgeInsets.only(top: 200.5, left: 40.0),
                  child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.triangleExclamation,
                                      color: Color(0xff11CCC3),
                                    ),
                                    Text('   Warning',
                                        style: TextStyle(
                                            fontFamily: 'font',
                                            color: Color(0xff11CCC3),
                                            fontSize: 15.sp)),
                                  ],
                                ),
                                backgroundColor: Color(0xffF0EFF5),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 34, vertical: 22),
                                children: [
                                  Text('Are you sure you want to\n logout?',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'font',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp)),
                                  SizedBox(
                                    height: 12.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.xmark,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  ' Cancel ',
                                                  style: TextStyle(
                                                      fontFamily: 'font',
                                                      fontSize: 17.sp,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // sharedPref?.setBool('isAuthorized', false);
                                          // sharedPref?.setString('role', 'User');
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                Future.delayed(
                                                    const Duration(seconds: 2),
                                                    () => Navigator.of(context)
                                                        .pop());
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Lottie.asset(
                                                        'assets/images/loading.json',
                                                        height: 18.h),
                                                    Text(
                                                      "Signing out..",
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontFamily: 'font',
                                                          letterSpacing: 1,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                );
                                              }).whenComplete(() {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    'Login', (route) => false);
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff11CCC3),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  '  Yes ',
                                                  style: TextStyle(
                                                      fontFamily: 'font',
                                                      fontSize: 17.sp,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                      child: SizedBox(
                          width: 120.0.sp,
                          height: 120.0.sp,
                          child: Card(
                            color: SettingCubit.get(context).isDark
                                ? Colors.grey
                                : Colors.white,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 9.sp,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.powerOff,
                                    color: SettingCubit.get(context).isDark
                                        ? Color(0xffFFBA5A)
                                        : Color(0xff11CCC3),
                                  ),
                                  SizedBox(
                                    height: 15.0.sp,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                      fontFamily: 'font',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0.sp,
                                      color: SettingCubit.get(context).isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.0.sp,
                                  ),
                                  Text(
                                    "Thanks for visiting",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: 'font',
                                      fontWeight: FontWeight.w100,
                                      color: SettingCubit.get(context).isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )),
                          )))),
            ),
          ),
        ],
      ),
    );
  }
}
