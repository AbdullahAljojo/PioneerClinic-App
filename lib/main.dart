import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/login/View.dart';

SharedPreferences? sharedPref;
late double width;

void main() async {
  width = 100.0; // Initialize the late variable
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClinicManagement',
      home: const LoginPage(),
    );
  }
}
