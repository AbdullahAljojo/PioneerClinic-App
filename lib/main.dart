import 'package:clinicmanagement/modul.dart/onBoarding.dart';
import 'package:clinicmanagement/modul.dart/profile.dart/profile.dart';
import 'package:clinicmanagement/modul.dart/setting/settingStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'bottomnav/bottomNavigation.dart';
import 'components.dart/blocObserver.dart';
import 'components.dart/cachHelper.dart';
import 'components.dart/theme.dart';
import 'home.dart';
import 'modul.dart/setting/setting.dart';
import 'modul.dart/setting/settingCubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
<<<<<<< HEAD
import 'pages/Home/homeView.dart';
import 'pages/MedicalInformatic/View.dart';
=======

>>>>>>> f3b1a76f03136a2a14aeaa4bedc4b3da53970d46
import 'pages/login/View.dart';
import 'pages/profile/ClinicProfile.dart';

SharedPreferences? sharedPref;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  bool? isDark = CacheHelper.get(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SettingCubit()..changeMode(fromShared: isDark),
        child: BlocConsumer<SettingCubit, SettingStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Sizer(
                builder: (BuildContext context, Orientation orientation,
                    DeviceType deviceType) {
                  return MaterialApp(
                      theme: light,
                      darkTheme: dark,
                      themeMode: SettingCubit.get(context).isDark
                          ? ThemeMode.dark
                          : ThemeMode.light,
                      debugShowCheckedModeBanner: false,
                      home: const ProfileScreen(),
                      routes: {
                        'Setting': (context) => Setting(),
<<<<<<< HEAD
                        'MedicalInfo': (context) => MedicalInfo(),
                        'Home': (context) => Home(),
                        'ClinicProfile': (context) => ClinicProfile(),
=======
>>>>>>> f3b1a76f03136a2a14aeaa4bedc4b3da53970d46
                      });
                },
              );
            }));
  }
}
