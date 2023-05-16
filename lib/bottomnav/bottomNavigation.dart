import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../home.dart';
import '../modul.dart/setting/setting.dart';
import '../profile/profile.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    const HOME(),
    const Setting(),
    const Profile(),
  ];

  List<AppBar> get appBars => [homeAppBar, settingsAppBar, profileAppBar];

  AppBar get profileAppBar => AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.teal, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );

  AppBar get homeAppBar => AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Clinics',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );

  AppBar get settingsAppBar {
    return AppBar(
        title: Row(
      children: const [
        Icon(Icons.settings_rounded),
        Text(
          '  Settings',
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
                      tabBackgroundColor: Colors.teal,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //Colors.grey[100]!,
                      color: Colors.black,
                      tabs: const [
                        GButton(
                          icon: LineIcons.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.settings,
                          text: 'Setting',
                        ),
                        GButton(
                          icon: LineIcons.user,
                          text: 'Profile',
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
