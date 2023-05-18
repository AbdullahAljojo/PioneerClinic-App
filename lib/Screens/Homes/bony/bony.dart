import 'package:flutter/material.dart';

class BonyScreen extends StatelessWidget {
  const BonyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('BonyScreen',style: TextStyle(color: Colors.teal,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
