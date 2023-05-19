import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  Function(String)? onFieldSubmitted,
  // Function? f,
  required String label,
  required IconData icon,
  IconData? icon1,
  bool obscure = false,
  Function? suffixPressed,
  GestureTapCallback? onTap,
}) =>
    TextFormField(
      obscureText: obscure,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onFieldSubmitted,
      // onChanged: (v) {
      //   f!(v);
      // },
      validator: validate,
      onTap: onTap,

      decoration: InputDecoration(
          labelText: (label),
          prefixIcon: Icon(icon),
          suffixIcon: IconButton(
              onPressed: () {
                suffixPressed!();
              },
              icon: Icon(icon1)),
          border: OutlineInputBorder()),

// keyboardType: TextInputType.phone,
    );