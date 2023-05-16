import 'package:flutter/material.dart';

class SurgeryScreen extends StatelessWidget {
  const SurgeryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('SurgeryScreen',style: TextStyle(color: Colors.teal,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
