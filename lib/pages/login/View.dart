import 'package:flutter/material.dart';
import 'Header.dart';
import 'InputWarapper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ]),
              ),
              child: Column(
                children: [
                  AppHeader(),
                  SingleChildScrollView(
                    child: Expanded(
                      flex: 2,
                      child: Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          decoration: const BoxDecoration(
                              color: Color(0xff11CCC3),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              )),
                          child: const SingleChildScrollView(
                              child: InputWarapper())),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
