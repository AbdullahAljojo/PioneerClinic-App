import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../main.dart';
import '../LogIn/View.dart';
import 'auth.dart';

Pattern pattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]+[a-zA-Z]+";

GlobalKey<FormState> formsate = GlobalKey<FormState>();
GlobalKey<FormState> formsate0 = GlobalKey<FormState>();
GlobalKey<FormState> formsate1 = GlobalKey<FormState>();
GlobalKey<FormState> formsate2 = GlobalKey<FormState>();

TextEditingController PatientName = TextEditingController();
TextEditingController Address = TextEditingController();
TextEditingController note = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmpass = TextEditingController();
TextEditingController SerialNumber = TextEditingController();
TextEditingController Cash = TextEditingController();

String? validusername(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "What's your name?";
    }
    if (val.trim().length < 4) {
      return "User name can't be less than 4 Characters";
    }
    if (val.trim().length > 24) {
      return "User name can't be more than 24 Characters";
    }
  }
}

String? validAddress(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "What's your Address?";
    }
    if (val.trim().length <= 3) {
      return "Sorry there's no Address less than 3 Characters";
    }
    if (val.trim().length > 24) {
      return "Address can't be more than 24 Characters";
    }
  }
}

String? validCounseling(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "What's your Counseling?";
    }
  }
}

String? validphone(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "Mobile phone is Required";
    }
    if (val.trim().length < 9) {
      return "Mobile number can't be less than 9 numbers";
    }
    if (val.trim().length > 9) {
      return "Mobile number can't be more than 9 numbers";
    }
  }
}

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

String? validpassword(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "Password is Required";
    }
    if (val.trim().length < 6) {
      return "Password must be at least 6 characters.";
    }
  }
}

String? validconfirmpassword(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "Confirm Password is Required";
    }
    if (val != password.text) {
      return " Password not match!";
    }
  }
}

String? validSerialNumber(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "Your Serial Number?";
    }
  }
}

String? validCash(String? val) {
  if (val != null) {
    if (val.trim().isEmpty) {
      return "Your Cash?";
    }
  }
}

String? _path;
int CurrentIndex = 0;

///this for Api if you need it >>
void register(BuildContext context) async {
  String p = '555';
  var state = await AuthApis.register(
      name: PatientName.text,
      email: emailcontroller.text,
      password: password.text,
      comfirmpassword: confirmpass.text,
      image: '${_path}',
      mobile_phone: '99999999',
      phone: p,
      address: 'syria',
      roll: 'Expert');

  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(
            const Duration(seconds: 2), () => Navigator.of(context).pop());
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset('assets/images/loading.json', height: 19.h),
            Text(
              "Uploading Data..".tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.sp,
                  decoration: TextDecoration.none,
                  fontFamily: 'font',
                  letterSpacing: 1),
            ),
          ],
        );
      }).whenComplete(() {
    state == false
        ? ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Colors.white,
              elevation: 40,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The email has already been taken.  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'font',
                        fontSize: 11.sp),
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          )
        : Navigator.of(context)
            .pushNamedAndRemoveUntil('Login', (route) => false);

    state == true
        ? ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Colors.white,
              elevation: 40,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your account has been created successfully  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'font',
                        fontSize: 11.sp),
                  ),
                  Icon(
                    Icons.gpp_good,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          )
        : '';
  });
  print('${state}');
  print('${sharedPref?.getString('token_reg')}');
}

// void create_expert() async {
//   var state2 = await AuthApis.create_expert(
//     name: sharedPref?.getString('role') == 'Expert'
//         ? Expertname.text
//         : username.text,
//     account: Cash.text,
//   );

//   if (state2 == true) {
//     print('${state2}');
//   } else
//     print('error');
//   print('${Cash.text}/${Expertname.text}');
// }

///

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var SelectedBlood = "A+";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/signUp.jpg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: 5.h,
                  left: 6.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Sign UP",
                        style: TextStyle(
                          fontFamily: 'font',
                          color: Colors.white,
                          fontSize: 38.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Creat account as Patient",
                          style: TextStyle(
                            fontFamily: 'font',
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                left: 6.w,
                top: 17.5.h,
              ),
              child: Container(
                height: 77.h,
                width: 88.w,
                padding: EdgeInsets.only(top: 3.h),
                decoration: BoxDecoration(
                  color: Color(0xff11CCC3),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.80),
                      blurRadius: 25,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor: Color(0xff11CCC3),
                      colorScheme:
                          ColorScheme.light(primary: Color(0xffFFBA5A))),
                  child: Stepper(
                    onStepTapped: (index) {
                      setState(() {
                        CurrentIndex <= 0
                            ? {
                                if (!formsate.currentState!.validate())
                                  {}
                                else
                                  CurrentIndex = index,
                              }
                            : CurrentIndex <= 1
                                ? {
                                    if (!formsate0.currentState!.validate())
                                      {}
                                    else
                                      CurrentIndex = index,
                                  }
                                : CurrentIndex <= 2
                                    ? {
                                        if (!formsate1.currentState!.validate())
                                          {}
                                        else
                                          CurrentIndex = index,
                                      }
                                    : CurrentIndex <= 3
                                        ? {
                                            if (!formsate2.currentState!
                                                .validate())
                                              {}
                                            else
                                              CurrentIndex = index,
                                          }
                                        : CurrentIndex = index;
                      });
                    },
                    elevation: 0,
                    type: StepperType.horizontal,
                    steps: getStepsPatient(),
                    currentStep: CurrentIndex,
                    onStepContinue: () {
                      //,,, save User and Expert information ,,,//

                      sharedPref?.setString('name', PatientName.text);
                      sharedPref?.setString('email', emailcontroller.text);
                      sharedPref?.setString('address', Address.text);
                      sharedPref?.setString('Counseling', SelectedBlood);
                      sharedPref?.setString('experience', note.text);
                      sharedPref?.setString('phone', phone.text);
                      sharedPref?.setString('cash', Cash.text);
                      sharedPref?.setString('serialnumber', SerialNumber.text);

                      setState(() {
                        CurrentIndex == 0
                            ? {
                                if (!formsate.currentState!.validate())
                                  {}
                                else
                                  CurrentIndex = CurrentIndex + 1,
                              }
                            : CurrentIndex == 1
                                ? {
                                    if (!formsate0.currentState!.validate())
                                      {}
                                    else
                                      (CurrentIndex = CurrentIndex + 1),
                                  }
                                : CurrentIndex == 2
                                    ? {
                                        if (!formsate1.currentState!.validate())
                                          {}
                                        else
                                          // register(),
                                          CurrentIndex = CurrentIndex + 1
                                      }
                                    : CurrentIndex == 3
                                        ? {
                                            if (!formsate2.currentState!
                                                .validate())
                                              {}
                                            else
                                              // register(context),

                                              showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 2),
                                                            () => Navigator.of(
                                                                    context)
                                                                .pop());
                                                        return Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Lottie.asset(
                                                                'assets/images/loading.json',
                                                                height: 19.h),
                                                            Text(
                                                              "Uploading Data.."
                                                                  .tr,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      21.sp,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontFamily:
                                                                      'font',
                                                                  letterSpacing:
                                                                      1),
                                                            ),
                                                          ],
                                                        );
                                                      })
                                                  .whenComplete(() => Navigator
                                                          .of(context)
                                                      .pushNamedAndRemoveUntil(
                                                          'Home',
                                                          (route) => false))
                                          }
                                        : {};
                      });
                    },
                    controlsBuilder: (context, details) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 1.h,
                              left: 1.w,
                              right: 5.w,
                            ),
                            child: InkWell(
                              onTap: details.onStepContinue,
                              child: Container(
                                alignment: Alignment.center,
                                height: 8.h,
                                width: 85.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFBA5A),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  CurrentIndex < 3
                                      ? 'Continue'.tr
                                      : CurrentIndex < 1
                                          ? 'Continue'.tr
                                          : 'Register'.tr,
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 19.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CurrentIndex < 1
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have account!',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontFamily: 'font'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                          fontFamily: 'font',
                                          color: Color(0xffFFBA5A),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(''),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> getStepsPatient() => [
        Step(
          state: CurrentIndex > 0 && CurrentIndex >= 1
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentIndex >= 0,
          title: Text(
            "",
            style: TextStyle(
              fontSize: 15.sp,
              color: CurrentIndex < 1 ? Colors.grey : Colors.white,
            ),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 2.3,
            child: Form(
                key: formsate,
                child: ListView(
                  physics: ScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: buildTextFormFieldAll(
                          'Enter Your Name',
                          ' Patient Name',
                          false,
                          TextInputType.name,
                          const Icon(
                            Icons.person,
                            color: Color(0xffFFBA5A),
                          ),
                          validusername,
                          PatientName,
                          null,
                          null),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: buildTextFormFieldAll(
                          'Enter Your Email'.tr,
                          ' Email'.tr,
                          false,
                          TextInputType.emailAddress,
                          const Icon(
                            Icons.email,
                            color: Color(0xffFFBA5A),
                          ),
                          validemail,
                          emailcontroller,
                          null,
                          null),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: buildTextFormFieldAll(
                          'Password'.tr,
                          'Password'.tr,
                          true,
                          TextInputType.multiline,
                          const Icon(
                            Icons.security,
                            color: Color(0xffFFBA5A),
                          ),
                          validpassword,
                          password,
                          null,
                          null),
                    ),
                    buildTextFormFieldAll(
                        'Password'.tr,
                        ' Confirm Password'.tr,
                        true,
                        TextInputType.multiline,
                        const Icon(
                          Icons.security,
                          color: Color(0xffFFBA5A),
                        ),
                        validconfirmpassword,
                        confirmpass,
                        null,
                        null),
                  ],
                )),
          ),
        ),
        Step(
          state: CurrentIndex > 1 ? StepState.complete : StepState.indexed,
          isActive: CurrentIndex >= 1,
          title: Text(
            "",
            style: TextStyle(
              fontSize: 15.sp,
              color: CurrentIndex < 1 ? Colors.grey : Colors.deepOrange,
            ),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 2.1,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formsate0,
              child: ListView(
                physics: ScrollPhysics(),
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 100.w,
                    height: 19.h,
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50.sp,
                              backgroundColor: Colors.grey,
                              foregroundImage: _path == null
                                  ? null
                                  : FileImage(File(_path!)),
                              child: Image.asset(
                                'assets/images/avatar.png',
                                height: 12.h,
                              ),
                            ),
                            Positioned(
                              top: 74.sp,
                              left: 70.sp,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 18,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.blue,
                                  child: IconButton(
                                    onPressed: () async {
                                      var imagePicker = ImagePicker();
                                      var xfile = _path == null
                                          ? await imagePicker.pickImage(
                                              source: ImageSource.gallery)
                                          : _path = null;
                                      if (xfile != null) {
                                        setState(() {
                                          _path = xfile.path;
                                          sharedPref?.setString("path", _path!);
                                        });
                                      } else {
                                        setState(() {
                                          _path = null;
                                          sharedPref?.setString("path", _path!);
                                        });
                                      }
                                    },
                                    icon: _path == null
                                        ? Icon(
                                            Icons.edit,
                                            size: 15.sp,
                                          )
                                        : Icon(
                                            Icons.delete,
                                            size: 15.sp,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: buildTextFormFieldAll(
                        'Enter Your Mobile'.tr,
                        'Phone'.tr,
                        false,
                        TextInputType.phone,
                        const Icon(
                          Icons.phone_android,
                          color: Color(0xffFFBA5A),
                        ),
                        validphone,
                        phone,
                        const Padding(
                          padding: EdgeInsets.only(right: 3),
                          child: Text(
                            "+963 ",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: buildTextFormFieldAll(
                        'Enter Your Address'.tr,
                        'Address'.tr,
                        false,
                        TextInputType.name,
                        const Icon(
                          Icons.home_outlined,
                          color: Color(0xffFFBA5A),
                        ),
                        validAddress,
                        Address,
                        null,
                        null),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
          state: CurrentIndex >= 2 ? StepState.complete : StepState.indexed,
          isActive: CurrentIndex >= 2,
          title: Text(
            "",
            style: TextStyle(
              fontSize: 15.sp,
              color: CurrentIndex < 1 ? Colors.grey : Colors.blue,
            ),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView(
              physics: ScrollPhysics(),
              children: [
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formsate1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Container(
                          padding: EdgeInsets.only(left: 20.sp),
                          width: 90.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            underline: SizedBox(),
                            value: SelectedBlood,
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'font',
                                fontSize: 14.sp),
                            onChanged: (e) {
                              setState(() {
                                SelectedBlood = (e as String?)!;
                                e == "Select Blood Group";
                              });
                            },
                            items: [
                              "A+",
                              "B+",
                              "AB+",
                              "O+",
                              "A-",
                              "B-",
                              "AB-",
                              "O-"
                            ]
                                .map((e) => DropdownMenuItem<String>(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.bloodtype,
                                            color: Color(0xffFFBA5A),
                                          ),
                                          Text(e),
                                        ],
                                      ),
                                      value: e,
                                    ))
                                .toList(),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: TextFormField(
                          maxLines: 6,
                          controller: note,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              counterText: "100/",
                              counterStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                              hintText: ' Any note?'.tr,
                              labelText: 'Enter your information here..'.tr,
                              labelStyle: TextStyle(
                                  fontFamily: 'font',
                                  color: Colors.black54,
                                  letterSpacing: 1,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                              helperMaxLines: 2,
                              hintStyle:
                                  const TextStyle(color: Color(0xff6d6c71)),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide:
                                    const BorderSide(color: Color(0xff6d6c71)),
                              ),
                              suffixIcon: note.text.isEmpty
                                  ? Container(
                                      width: 0,
                                    )
                                  : IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ),
                                      onPressed: () => note.clear(),
                                    )),
                          maxLength: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: CurrentIndex >= 3 ? StepState.complete : StepState.indexed,
          isActive: CurrentIndex >= 3,
          title: Text(
            "",
            style: TextStyle(
              fontSize: 15.sp,
              color: CurrentIndex < 1 ? Colors.grey : Colors.blue,
            ),
          ),

          /// CreditCard ///
          content: Form(
            key: formsate2,
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Lottie.asset('assets/images/creditCard.json',
                          height: 40.h),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 110.sp, left: 16.sp),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Cash : '.tr,
                                style: TextStyle(
                                    fontFamily: 'font', color: Colors.white),
                              ),
                              Text(
                                Cash.text,
                                style: TextStyle(
                                    fontFamily: 'font', color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Serial Number : '.tr,
                                style: TextStyle(
                                    fontFamily: 'font', color: Colors.white),
                              ),
                              Text(
                                SerialNumber.text,
                                style: TextStyle(
                                    fontFamily: 'font', color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  child: buildTextFormFieldAll(
                      'Serial Number'.tr,
                      ' Enter Your Serial Number'.tr,
                      false,
                      TextInputType.multiline,
                      const Icon(
                        Icons.numbers,
                        color: Color(0xffFFBA5A),
                      ),
                      validSerialNumber,
                      SerialNumber,
                      null,
                      null),
                ),
                Container(
                  padding: EdgeInsets.only(top: 7.sp, bottom: 9.sp),
                  child: buildTextFormFieldAll(
                      'Cash'.tr,
                      ' Enter Your Cash'.tr,
                      false,
                      TextInputType.multiline,
                      const Icon(
                        Icons.monetization_on,
                        color: Color(0xffFFBA5A),
                      ),
                      validCash,
                      Cash,
                      null,
                      null),
                )
              ],
            ),
          ),
        ),
      ];
}

Padding buildTextFormFieldAll(
    String hintText,
    String labelText,
    bool pssword,
    TextInputType keyboardType,
    Widget prefixIcon,
    myvalied,
    TextEditingController controllers,
    Widget? perfix,
    int? maxLength) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2),
    child: TextFormField(
      controller: controllers,
      validator: myvalied,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          counterText: "",
          prefix: perfix,
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black54),
          helperMaxLines: 2,
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(color: Color(0xff6d6c71)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xff6d6c71)),
          ),
          suffixIcon: controllers.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () => controllers.clear(),
                )),
      maxLength: maxLength,
      obscureText: pssword,
      keyboardType: keyboardType,
    ),
  );
}
