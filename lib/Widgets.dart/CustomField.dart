import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomFields extends StatefulWidget {
  final String label;
  final Widget icon;
  final bool isPass;
  final bool isEmail;
  final bool isPhone;
  final TextEditingController controller;

  // final FormFieldValidator<String>? validator;

  CustomFields({
    required this.label,
    required this.icon,
    required this.isPass,
    required this.isEmail,
    required this.isPhone,
    required this.controller,
    //required this.validator,
  });

  @override
  State<CustomFields> createState() => _CustomFieldsState();
}

class _CustomFieldsState extends State<CustomFields> {
  IconData visibility = Icons.visibility_off_outlined;
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.8.h),
      child: TextFormField(
        controller: widget.controller,
        // validator: widget.validator,
        obscureText: widget.isPass && hide == true ? true : false,
        keyboardType: widget.isPass == true
            ? TextInputType.visiblePassword
            : widget.isEmail == true
                ? TextInputType.emailAddress
                : widget.isPhone == true
                    ? TextInputType.phone
                    : TextInputType.name,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffffffff),
          label: Text(
            widget.label,
            style: TextStyle(
              color: Colors.black26,
              fontFamily: 'font',
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.black54,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.orange,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1.8,
              color: Colors.red,
            ),
          ),
          //prefixIcon: widget.icon,
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 3.w,
              ),
              widget.icon,
              SizedBox(
                width: 2.w,
              ),
              SizedBox(
                height: 4.h, // Set a specific width for the SizedBox
                child: VerticalDivider(
                  thickness: 0.3.w,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
            ],
          ),
          suffixIcon: widget.isPass == true
              ? IconButton(
                  icon: hide
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.deepPurple,
                          size: 20.sp,
                        )
                      : Icon(
                          Icons.visibility,
                          color: Colors.deepPurple,
                          size: 20.sp,
                        ),
                  onPressed: () {
                    setState(() {
                      hide = !hide;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
