import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.hintString,
    this.labelTextString,
    this.obscureString = false,
    this.containerFilled = false,
    this.passwordSuffixIcon,
    this.customTextStyle,
    this.textInputType,
    this.searchPrefixIcon,
    required this.enableBorderStyle,
    required this.focusBorderStyle,
    required this.controller, this.onChangeAction,
  }) : super(key: key);

  String? hintString;
  String? labelTextString;
  bool obscureString;
  bool containerFilled;
  Widget? passwordSuffixIcon;
  Widget? searchPrefixIcon;
  final OutlineInputBorder enableBorderStyle;
  final OutlineInputBorder focusBorderStyle;
  TextStyle? customTextStyle;
  TextInputType? textInputType;
  final TextEditingController controller;
  final Function(String)? onChangeAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureString,
      style: customTextStyle,
      keyboardType: textInputType,
      onChanged: onChangeAction,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelTextString,
        hintStyle: TextStyle(
            fontSize: 9,
            color: Colors.grey.shade300,
            fontWeight: FontWeight.w300),
        filled: containerFilled,
        prefixIcon: searchPrefixIcon,
        prefixIconColor: Colors.grey,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        suffixIcon: passwordSuffixIcon,
        hintText: hintString,
        enabledBorder: enableBorderStyle,
        // border: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.red),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        focusedBorder: focusBorderStyle,
      ),
    );
  }
}
