import 'package:clinicmanagement/Screens/MedicalInformatic/View.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../Setting/settingCubit.dart';
import '../home.dart';
import '../../Setting/setting.dart';
import '../../infoDoctor/p.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    const HOME(),
    MedicalInfo(),
    const Profile(),
    const Setting(),
  ];

  List<AppBar> get appBars =>
      [homeAppBar, InfoAppBar, profileAppBar, settingsAppBar];

  AppBar get InfoAppBar => AppBar(
        centerTitle: true,
        title: Text(
          'Medical Informatic',
          style: TextStyle(
              fontFamily: 'font',
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: 0.6.sp),
        ),
      );
  AppBar get profileAppBar => AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.teal,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'font'),
        ),
      );

  AppBar get homeAppBar => AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'find a way easily',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'font'),
        ),
        actions: [
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(const Duration(seconds: 1),
                          () => Navigator.of(context).pop());
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Lottie.asset('assets/images/loading.json',
                              height: 80.sp, fit: BoxFit.cover),
                        ],
                      );
                    }).whenComplete(() {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'ClinicProfile', (route) => false);
                });
              },
              child: Image.asset('assets/images/ClinicLogo.png')),
          SizedBox(
            width: 8.sp,
          )
        ],
      );

  AppBar get settingsAppBar {
    return AppBar(
        title: Row(
      children: const [
        Icon(FontAwesomeIcons.sliders),
        Text(
          '   Settings',
          //style:TextStyle(color:Color(0xFF11CCC3) )
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'font'),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GNav(
                      rippleColor: Colors.teal,
                      hoverColor: Colors.grey[100]!,
                      gap: 5,
                      activeColor: Colors.white,
                      iconSize: 20,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      duration: const Duration(milliseconds: 100),
                      tabBackgroundColor: SettingCubit.get(context).isDark
                          ? Color(0xffFFBA5A)
                          : Color(0xff11CCC3),
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //Colors.grey[100]!,
                      color: Colors.black,
                      tabs: [
                        GButton(
                          icon: FontAwesomeIcons.houseChimneyMedical,
                          text: 'Home',
                        ),
                        GButton(
                          icon: FontAwesomeIcons.suitcaseMedical,
                          text: 'Infoma',
                        ),
                        GButton(
                          icon: FontAwesomeIcons.userTie,
                          text: 'Profile',
                        ),
                        GButton(
                          icon: FontAwesomeIcons.gear,
                          text: 'Setting',
                        ),
                      ],
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      })))),
      appBar: appBars[_selectedIndex],
      body: screens[_selectedIndex],
    );
  }
}
