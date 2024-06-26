import 'package:flutter/material.dart';

class AppCommonField extends StatelessWidget {
  final double width;
  final double borderRadius;
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final IconData? prefixIcon;
  final TextInputType textType;
  final String? Function(String?)? validator;
  static const textFieldErrorMessage = 'Field is required';
  final Color iconColor;
  final Color inputTextColor;
  final double value;
  final Color textColor;

  const AppCommonField(
      {super.key,
      this.icon,
      this.prefixIcon,
      this.textType = TextInputType.text,
      required this.width,
      this.value = 0.0,
      required this.borderRadius,
      required this.controller,
      required this.label,
      this.iconColor = Colors.blue,
      this.textColor = Colors.blue,
      this.inputTextColor = Colors.black,
      this.validator});

  @override
  Widget build(BuildContext context) {
    String? defaulValidator(String? value) {
      return value!.isEmpty ? textFieldErrorMessage : null;
    }

    return SizedBox(
      width: width,
      child: TextFormField(
        style: TextStyle(color: inputTextColor),
        controller: controller,
        validator: validator ?? defaulValidator,
        cursorColor: Colors.blue,
        keyboardType: textType,
        // initialValue: value != 0.0 ? value.toString() : null,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: iconColor,
          icon: icon == null ? null : Icon(icon),
          iconColor: iconColor,
          helperText: '',
          label: Text(
            label,
            style: TextStyle(color: textColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
