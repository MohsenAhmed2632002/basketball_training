import 'package:basketball_training/core/Theming/Font.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextStyle? hintstyle;
  final TextStyle? inputTextstyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final String hitText;
  final String label;
  final TextEditingController? controller;
  final Function(String?) validator;
  MyTextFormField({
    super.key,
    this.hintstyle,
    this.inputTextstyle,
    this.isObscureText,
    this.suffixIcon,
    required this.hitText,
    required this.label,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hitText,
        label: Text(label),
      ),
      obscureText: isObscureText ?? false,
      style: getItalicTextStyle(
        context: context,
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: getRegulerTextStyle(
          context: context,
          color: Colors.white,
          fontSize: 25,
        ),
      ),
     
    );
  }
}
