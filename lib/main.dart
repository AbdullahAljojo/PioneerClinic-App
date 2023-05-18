import 'package:clinicmanagement/Screens/infoDoctor/profile.dart';
import 'package:clinicmanagement/Screens/infoDoctor/profileCubit.dart';
import 'package:clinicmanagement/Screens/Setting/settingStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'Components.dart/Widgets.dart/Navigation_Bar.dart';
import 'Components.dart/blocObserver.dart';
import 'Components.dart/cachHelper.dart';
import 'Components.dart/theme.dart';
import 'Screens/Homes/home.dart';
import 'Screens/infoDoctor/p.dart';
import 'Screens/Setting/setting.dart';
import 'Screens/Setting/settingCubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Homes/homeTest.dart';
import 'Screens/MedicalInformatic/View.dart';

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
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (BuildContext context) => ProfileCubit()),
      
      ],

   child: BlocProvider(
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
                      home: const Profile(),
                      routes: {
                        'Setting': (context) => Setting(),
                        'MedicalInfo': (context) => MedicalInfo(),
                        'Home': (context) => Home(),
                        // 'ClinicProfile': (context) => ClinicProfile(),
                      });
                },
              );
            })));
  }
}
