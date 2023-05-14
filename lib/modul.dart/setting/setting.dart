import 'package:clinicmanagement/components.dart/background.dart';
import 'package:clinicmanagement/modul.dart/setting/settingCubit.dart';
import 'package:clinicmanagement/modul.dart/setting/settingStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Setting',
            //style:TextStyle(color:Color(0xFF11CCC3) )
          ),
        ),
        body: Stack(
          children: [
            BackGround('assets/images/Processing-bro (1).png', 0.2),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    item(
                        text: 'change mode',
                        icon: IconButton(
                            icon: const Icon(
                              Icons.brightness_4_outlined,
                              size: 30,
                            ),
                            onPressed: () {
                              SettingCubit.get(context).changeMode();
                            })),
                    const SizedBox(
                      height: 30,
                    ),
                    item(
                        text: 'change language',
                        icon: IconButton(
                            icon: const Icon(
                              Icons.language_rounded,
                              size: 30,
                            ),
                            onPressed: () {})),
                    const SizedBox(
                      height: 30,
                    ),
                    item(
                        text: 'log out',
                        icon: IconButton(
                            icon: const Icon(
                              Icons.logout_outlined,
                              size: 30,
                            ),
                            onPressed: () {})),
                    const SizedBox(
                      height: 30,
                    ),
                    item(
                        text: 'anything else',
                        icon: IconButton(
                            icon: const Icon(
                              Icons.logout_outlined,
                              size: 30,
                            ),
                            onPressed: () {}))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

Widget item({required String text, required IconButton icon}) => Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.175),
      borderRadius: BorderRadius.circular(
        30,
      ),
    ),
    //  color: Colors.white70,
    child: Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Text(
          '$text',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        icon
      ],
    ));
