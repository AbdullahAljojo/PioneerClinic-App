import 'package:clinicmanagement/modul.dart/setting/mySetting.dart';
import 'package:clinicmanagement/pages/Home/homeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../Controllers/HomeController.dart';
import '../modul.dart/setting/setting.dart';
import '../pages/MedicalInformatic/View.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeView(),
              MedicalInfo(),
              Setting(),
            ],
            onPageChanged: (index) {
              controller.pageInx.value = index;
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xff11CCC3),
            selectedLabelStyle: TextStyle(
              fontFamily: 'font',
            ),
            currentIndex: controller.pageInx.value,
            onTap: (index) => controller.toPage(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home_filled,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.medical_information_outlined),
                label: 'Informatic',
                activeIcon: Icon(
                  Icons.medical_information_rounded,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Setting',
                activeIcon: Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
