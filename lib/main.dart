import 'package:clinicmanagement/modul.dart/onBoarding.dart';
import 'package:clinicmanagement/modul.dart/setting/settingStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'Widgets.dart/Navigation_Bar.dart';
import 'components.dart/blocObserver.dart';
import 'components.dart/cachHelper.dart';
import 'components.dart/theme.dart';
import 'modul.dart/setting/setting.dart';
import 'modul.dart/setting/settingCubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/Home/homeView.dart';
import 'pages/MedicalInformatic/View.dart';
import 'pages/login/View.dart';

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
                      home: LoginPage(),
                      routes: {
                        'Setting': (context) => Setting(),
                        'MedicalInfo': (context) => MedicalInfo(),
                        'Home': (context) => Home(),
                      });
                },
              );
            }));
  }
}
