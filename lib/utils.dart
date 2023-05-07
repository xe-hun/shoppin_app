import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(
        {required String hint, required Widget prefixIcon}) =>
    InputDecoration(
      contentPadding: const EdgeInsets.only(top: 20),
      hintText: hint,
      prefixIcon: prefixIcon,

      hintStyle: TextStyle(color: Colors.grey.shade400),
      // fillColor: Theme.of(context).colorScheme.background,
      fillColor: Colors.white,
      border: inputBorder,
      errorBorder: inputBorder,
      focusedBorder: inputBorder,
      focusedErrorBorder: inputBorder,
      disabledBorder: inputBorder,
      enabledBorder: inputBorder,
    );

InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey.shade400));

Widget putBadge({required String badgeContent, required Widget child}) {
  return Stack(
    children: [
      child,
      Positioned(
          top: 5,
          right: 5,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Text(
                badgeContent,
                style: TextStyle(color: Colors.grey.shade50),
              ),
            ),
          ))
    ],
  );
}

Color secondaryColor = const Color.fromARGB(255, 38, 136, 113);
