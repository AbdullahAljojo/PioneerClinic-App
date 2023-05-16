import 'package:flutter/material.dart';

class HeartScreen extends StatelessWidget {
  const HeartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('HeartScreen',style: TextStyle(color: Colors.teal,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
