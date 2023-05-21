import 'package:clinicmanagement/Screens/Proflies/ClinicProfile/ClinicProfile.dart';
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
import 'Screens/Homes/search.dart';
import 'Screens/Login/View.dart';
import 'Screens/Register/register.dart';
import 'Screens/infoDoctor/p.dart';
import 'Screens/Setting/setting.dart';
import 'Screens/Setting/settingCubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Homes/homeTest.dart';
import 'Screens/MedicalInformatic/View.dart';
import 'Screens/onBoarding.dart';

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
                          home: HOME(),
                          routes: {
                            'Login': (context) => LoginPage(),
                            'Setting': (context) => Setting(),
                            'MedicalInfo': (context) => MedicalInfo(),
                            'Home': (context) => HOME(),
                            'ClinicProfile': (context) => ClinicProfile(),
                            'register': (context) => Register(),
                            'Search': (context) => Search(),
                          });
                    },
                  );
                })));
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }
}
