import 'package:clinicmanagement/modul.dart/onBoarding.dart';
import 'package:clinicmanagement/modul.dart/setting/settingStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components.dart/blocObserver.dart';
import 'components.dart/cachHelper.dart';
import 'components.dart/theme.dart';
import 'modul.dart/setting/setting.dart';
import 'modul.dart/setting/settingCubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
              return MaterialApp(
                theme: light,
                darkTheme: dark,
                themeMode: SettingCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: const Setting(),
              );
            }));
  }
}
