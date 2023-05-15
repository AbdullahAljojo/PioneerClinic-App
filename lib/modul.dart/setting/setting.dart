import 'package:clinicmanagement/components.dart/background.dart';
import 'package:clinicmanagement/modul.dart/setting/settingCubit.dart';
import 'package:clinicmanagement/modul.dart/setting/settingStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

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
      appBar: AppBar(
          title: Row(
        children: [
          Icon(Icons.arrow_back),
          Text(
            '  Setting',
            //style:TextStyle(color:Color(0xFF11CCC3) )
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'font'),
          ),
        ),
        body: Stack(
          children: [
            BackGround('assets/images/Processing-bro (1).png', 0.2),

          
            Column(
              children: [
                Stack(
                  children:[ CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://image.shutterstock.com/image-photo/closeup-photo-amazing-short-hairdo-260nw-1617540484.jpg'),
                    radius: 70,
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   radius: 8,
                  // ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.green,
                  //   radius: 7,
                  // ),
                  Icon(Icons.edit)]
                ),
                
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      height: 500,
                      child: GridView.count(crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        item(
                           text: 'change mode',
                               icon: IconButton(
                                   icon: const Icon(
                                     Icons.brightness_4_outlined,
                                     size: 30,
                                   ),
                                   onPressed: () {
                                     SettingCubit.get(context).changeMode();
                                   })
                        ),
                        item(
                                      text: 'change language',
                              icon: IconButton(
                                  icon: const Icon(
                                    Icons.language_rounded,
                                    size: 30,
                                  ),
                                  onPressed: () {})),
                          const SizedBox(
                            height: 30,
                        ),
                        item(
                                       text: 'log out',
                              icon: IconButton(
                                  icon: const Icon(
                                    Icons.logout_outlined,
                                    size: 30,
                                  ),
                                  onPressed: () {})),
                          const SizedBox(
                            height: 30,
                        ),
                      ],),
                    ),
                  ),
                ),
              ],
            )
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: SingleChildScrollView(
            //     child: 
            //     Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         item(
            //             text: 'change mode',
            //             icon: IconButton(
            //                 icon: const Icon(
            //                   Icons.brightness_4_outlined,
            //                   size: 30,
            //                 ),
            //                 onPressed: () {
            //                   SettingCubit.get(context).changeMode();
            //                 })),
            //         const SizedBox(
            //           height: 30,
            //         ),
            //         item(
            //             text: 'change language',
            //             icon: IconButton(
            //                 icon: const Icon(
            //                   Icons.language_rounded,
            //                   size: 30,
            //                 ),
            //                 onPressed: () {})),
            //         const SizedBox(
            //           height: 30,
            //         ),
            //         item(
            //             text: 'log out',
            //             icon: IconButton(
            //                 icon: const Icon(
            //                   Icons.logout_outlined,
            //                   size: 30,
            //                 ),
            //                 onPressed: () {})),
            //         const SizedBox(
            //           height: 30,
            //         ),
            //         item(
            //             text: 'anything else',
            //             icon: IconButton(
            //                 icon: const Icon(
            //                   Icons.logout_outlined,
            //                   size: 30,
            //                 ),
            //                 onPressed: () {})),
            //                 itemm()

            //       ],
            //     ),
            //   ),
            // ),
          ],
        ));
=======
        ],
      )),
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
                                      child: const Text('Close'),
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
                                    color: Color(0xffFFBA5A),
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
                                    color: Color(0xffFFBA5A),
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
                                    Icons.login_outlined,
                                    color: Color(0xffFFBA5A),
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
              )
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: SingleChildScrollView(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         item(
                  //             text: 'change mode',
                  //             icon: IconButton(
                  //                 icon: const Icon(
                  //                   Icons.brightness_4_outlined,
                  //                   size: 30,
                  //                 ),
                  //                 onPressed: () {
                  //                   SettingCubit.get(context).changeMode();
                  //                 })),
                  //         const SizedBox(
                  //           height: 30,
                  //         ),
                  //         item(
                  //             text: 'change language',
                  //             icon: IconButton(
                  //                 icon: const Icon(
                  //                   Icons.language_rounded,
                  //                   size: 30,
                  //                 ),
                  //                 onPressed: () {})),
                  //         const SizedBox(
                  //           height: 30,
                  //         ),
                  //         item(
                  //             text: 'log out',
                  //             icon: IconButton(
                  //                 icon: const Icon(
                  //                   Icons.logout_outlined,
                  //                   size: 30,
                  //                 ),
                  //                 onPressed: () {})),
                  //         const SizedBox(
                  //           height: 30,
                  //         ),
                  //         item(
                  //             text: 'anything else',
                  //             icon: IconButton(
                  //                 icon: const Icon(
                  //                   Icons.logout_outlined,
                  //                   size: 30,
                  //                 ),
                  //                 onPressed: () {}))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  ))
        ],
      ),
    );

  }
}

// Widget item({required String text, required IconButton icon}) => Container(
//     height: 100,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Colors.grey.withOpacity(0.175),
//       borderRadius: BorderRadius.circular(
//         30,
//       ),
//     ),
//     //  color: Colors.white70,
//     child: Row(
//       children: [
//         const SizedBox(
//           width: 30,
//         ),
//         Text(
//           '$text',
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const Spacer(),
//         icon
//       ],
      
//     ));

Widget item({required String text, required IconButton icon}) => Card(
  
  color: Colors.grey,
 elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             icon ,
            const SizedBox(height: 10,),
            Text( '$text',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ],
        ),
      ),
    );
