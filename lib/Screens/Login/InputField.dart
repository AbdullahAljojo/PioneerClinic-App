import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'Button.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InputFieldState();
  }
}

GlobalKey<FormState> formsate = GlobalKey<FormState>();

String? validemail(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "What's your Email?";
    }
    if (val.trim().length < 4) {
      return "Email can't be less than 4 Characters";
    }
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]+[a-zA-Z]+");
    if (!regex.hasMatch(val)) return "example@gmail.com";
  }
  return null;
}

String? validpass(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "Your Password ?";
    }
    if (val.trim().length < 6) {
      return "Password must be at least 6 characters.";
    }
  }
  return null;
}

bool _securpass = true;

class _InputFieldState extends State<InputField> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    signinemail() async {
      if (formsate.currentState!.validate()) {
        formsate.currentState!.save();
        var data = {
          'email': emailcontroller.text,
          'password': passwordcontroller.text
        };

        final String emailControl = emailcontroller.text;
        // sharedPref?.setString('_email', emailControl);
        // sharedPref?.setBool('isAuthorized', true);

        showDialog(
            context: context,
            builder: (context) {
              Future.delayed(const Duration(seconds: 4),
                  () => Navigator.of(context).pop());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset('assets/images/loading.json',
                      height: 80.sp, fit: BoxFit.cover),
                  Text(
                    "Please Wait..",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.sp,
                        fontFamily: 'font',
                        letterSpacing: 1),
                  ),
                ],
              );
            }).whenComplete(() {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('Home', (route) => false);
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text('Your Email is $emailControl'),
            ));
        });
      }
    }

    return Stack(
      children: [
        Form(
            key: formsate,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white))),
                  child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          hintText: "Enter your email",
                          hintStyle: const TextStyle(color: Colors.white),
                          border: InputBorder.none,
                          suffixIcon: emailcontroller.text.isEmpty
                              ? Container(
                                  width: 0,
                                )
                              : IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white54,
                                  ),
                                  onPressed: () => emailcontroller.clear(),
                                )),
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: validemail),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white))),
                  child: TextFormField(
                    controller: passwordcontroller,
                    validator: validpass,
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        hintStyle: const TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            icon: _securpass
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white54,
                                  )
                                : const Icon(Icons.visibility,
                                    color: Color(0xffFFBA5A)),
                            onPressed: () => setState(() {
                                  _securpass = !_securpass;
                                }))),
                    style: const TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.done,
                    obscureText: _securpass,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                    child: MyButton(),
                    onTap: () async {
                      signinemail();
                    })
              ],
            ))
      ],
    );
  }
}
