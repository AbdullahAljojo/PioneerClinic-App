import 'package:clinicmanagement/pages/login/InputFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class InputWarapper extends StatelessWidget {
  const InputWarapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff002c42),
                borderRadius: BorderRadius.circular(10)),
            child: const InputField(),
          ),
          const SizedBox(height: 30),
           Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'font',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "Don't have an account? ",
                style:
                TextStyle(fontFamily: 'font',fontStyle: FontStyle.italic, color: Colors.white),
              ),
              InkWell(
                child:  Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffdf07),
                  ),
                ),
                onTap: () {
                  
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
